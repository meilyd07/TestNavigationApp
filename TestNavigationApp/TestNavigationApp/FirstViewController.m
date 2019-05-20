//
//  FirstViewController.m
//  TestNavigationApp
//
//  Created by Hanna Rybakova on 5/3/19.
//  Copyright © 2019 None. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"First view controller";
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
               action:@selector(buttonClick)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Show second View" forState:UIControlStateNormal];
    button.frame = CGRectMake(self.view.frame.size.width/2.0 - 80, self.view.frame.size.height/2.0 - 80, 160.0, 40.0);
    [button setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:button];
    self.view.backgroundColor = [UIColor redColor];
}

-(void)buttonClick {
    UIViewController *second = [[SecondViewController alloc] init];
    [self.flowDelegate pushViewController:second];
    [second release];
}
@end
