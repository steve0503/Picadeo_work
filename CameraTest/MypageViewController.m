//
//  MypageViewController.m
//  CameraTest
//
//  Created by SDT-1 on 2014. 1. 27..
//  Copyright (c) 2014년 iamdreamer. All rights reserved.
//

#import "MypageViewController.h"
#import "ContainerViewController.h"

@interface MypageViewController ()

@property (nonatomic) NSInteger selectedSegmentIndex;

@property (nonatomic, weak) ContainerViewController *containerViewController;

@end

@implementation MypageViewController



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"embedContainer"]) {
        
        self.containerViewController = segue.destinationViewController;
        
    }
}



- (IBAction)handleSegmentSelection:(id)sender {
    
    UISegmentedControl *control = (UISegmentedControl *)sender;

    NSInteger selectedIndex = control.selectedSegmentIndex;

    
    switch (selectedIndex) {
        
        case 0:
            
            [self.containerViewController switchToMyVideoViewController];
            
            break;
            
            
        case 1:
            
             [self.containerViewController switchToMyVideoViewController];
            
            break;
            
        case 2:
            
             [self.containerViewController switchToSettingViewController];
            
            break;
            
            
        default:
            
            [self.containerViewController switchToMyVideoViewController];
            
            break;
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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
