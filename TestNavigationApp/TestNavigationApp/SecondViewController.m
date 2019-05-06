//
//  SecondViewController.m
//  TestNavigationApp
//
//  Created by Hanna Rybakova on 5/3/19.
//  Copyright © 2019 None. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Second view controller";
    // Do any additional setup after loading the view.
    CGRect labelFrame = CGRectMake(40,40,200,44);
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:labelFrame];
    NSDateFormatter *format = [[[NSDateFormatter alloc] init] autorelease];
    [format setDateFormat:@"dd/MM/yyyy HH:mm"];
    NSString *currentDate = [format stringFromDate:[NSDate date]];
    dateLabel.text = currentDate;
    [self.view addSubview:dateLabel];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
               action:@selector(buttonClick)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Show third View" forState:UIControlStateNormal];
    button.frame = CGRectMake(self.view.frame.size.width/2.0 - 80, self.view.frame.size.height/2.0 - 80, 160.0, 40.0);
    [button setBackgroundColor:[UIColor darkGrayColor]];
    [self.view addSubview:button];
}

-(void)buttonClick {
    UIViewController *third = [[ThirdViewController alloc] init];
    [self.flowDelegate pushViewController:third];
    [third release];
}

@end
