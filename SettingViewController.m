//
//  SettingViewController.m
//  CameraTest
//
//  Created by SDT-1 on 2014. 1. 27..
//  Copyright (c) 2014년 iamdreamer. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingCell.h"

#define CELL_ID @"CELL_ID"

@interface SettingViewController (){
    
    
    NSMutableArray *settingItems;
    
    
}

@property (weak, nonatomic) IBOutlet UITableView *settingtableView;

@end

@implementation SettingViewController

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [settingItems count];
    
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
     SettingCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    
    cell.textLabel.text = [settingItems objectAtIndex:indexPath.row];
    
    return cell;
    
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
    
    settingItems = [[NSMutableArray alloc] initWithObjects: @"버전정보",@"도움말",@"계정설정",@"비밀번호",@"SNS설정",@"로그아웃", nil];
    
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
