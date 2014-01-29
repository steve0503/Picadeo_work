//
//  ContainerViewController.m
//  CameraTest
//
//  Created by SDT-1 on 2014. 1. 27..
//  Copyright (c) 2014년 iamdreamer. All rights reserved.
//

#import "ContainerViewController.h"

#import "SettingViewController.h"

#import "MyVideoViewController.h"

#define SegueIdentifierFirst @"embedFirst"
#define SegueIdentifierSecond @"embedSecond"

@interface ContainerViewController ()

@property (strong, nonatomic) NSString *currentSegueIdentifier;


@property (strong, nonatomic) MyVideoViewController *myVideoViewController;
@property (strong, nonatomic) SettingViewController *settingViewController;

//@property (assign, nonatomic) BOOL transitionInProgress;


@end

@implementation ContainerViewController




- (void)viewDidLoad
{
    [super viewDidLoad];
    
 //   self.transitionInProgress = NO;
    
    self.currentSegueIdentifier = SegueIdentifierFirst;
    
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Instead of creating new VCs on each seque we want to hang on to existing
    // instances if we have it. Remove the second condition of the following
    // two if statements to get new VC instances instead.
    if (([segue.identifier isEqualToString:SegueIdentifierFirst]) && !self.myVideoViewController) {
        self.myVideoViewController = segue.destinationViewController;
    }
    
    if (([segue.identifier isEqualToString:SegueIdentifierSecond]) && !self.settingViewController) {
        self.settingViewController = segue.destinationViewController;
    }
    
    // If we're going to the first view controller.
    if ([segue.identifier isEqualToString:SegueIdentifierFirst]) {
        // If this is not the first time we're loading this.
        if (self.childViewControllers.count > 0) {
            [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.myVideoViewController];
        }
        else {
            // If this is the very first time we're loading this we need to do
            // an initial load and not a swap.
            [self addChildViewController:segue.destinationViewController];
            UIView* destView = ((UIViewController *)segue.destinationViewController).view;
            destView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            destView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:destView];
            [segue.destinationViewController didMoveToParentViewController:self];
        }
    }
    // By definition the second view controller will always be swapped with the
    // first one.
    else if ([segue.identifier isEqualToString:SegueIdentifierSecond]) {
        [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.settingViewController];
    }
}

- (void)swapFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController
{
    toViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [fromViewController willMoveToParentViewController:nil];
    [self addChildViewController:toViewController];
    
    [self transitionFromViewController:fromViewController toViewController:toViewController duration:1.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        [fromViewController removeFromParentViewController];
        [toViewController didMoveToParentViewController:self];
   //     self.transitionInProgress = NO;
    }];
}


- (void)swapViewControllers
{
    self.currentSegueIdentifier = ([self.currentSegueIdentifier  isEqual: SegueIdentifierFirst]) ? SegueIdentifierSecond : SegueIdentifierFirst;

    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];

}

-(void)switchToMyVideoViewController{
    
    
    
 //   if (self.transitionInProgress) {
//        return;
//    }

//    self.transitionInProgress = YES;
    
    if ([self.currentSegueIdentifier isEqual:SegueIdentifierSecond]) {
        
        self.currentSegueIdentifier = SegueIdentifierFirst;
        
        [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
    }
    
}

-(void)switchToSettingViewController{
    
    
 //   if (self.transitionInProgress) {
 //       return;
 //   }
    
 //   self.transitionInProgress = YES;
    
    if ([self.currentSegueIdentifier isEqual:SegueIdentifierFirst]) {
        
        self.currentSegueIdentifier = SegueIdentifierSecond;
        
        [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
    }
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end





