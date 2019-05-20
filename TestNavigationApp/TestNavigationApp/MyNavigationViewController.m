//
//  ViewController.m
//  TestNavigationApp
//
//  Created by Hanna Rybakova on 5/2/19.
//  Copyright © 2019 None. All rights reserved.
//

#import "MyNavigationViewController.h"
#import "HAViewController.h"
#import "NavigationView.h"

@interface MyNavigationViewController ()
@property (nonatomic, retain, readwrite) NSMutableArray *childViewControllers;
@property (nonatomic, retain) NavigationView *navigationView;
@property (nonatomic, retain) NSString *titleView;
@end

@implementation MyNavigationViewController

@synthesize navigationView;
@synthesize titleView;

- (void)dealloc
{
    self.navigationView = nil;
    self.childViewControllers = nil;
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.childViewControllers = [[NSMutableArray alloc] init];
    self.navigationView = [[NavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 70) /*andTitle:titleView*/];
    [self.view addSubview:self.navigationView];
    //[navigationView release];
}

//- (void)pressBack {
//    [self popViewController];
//    NSLog(@"Print back");
//}

- (void)removeLastViewController {
    UIViewController *vc = [self.childViewControllers lastObject];
    [vc willMoveToParentViewController:nil];
    [vc.view removeFromSuperview];
    [vc removeFromParentViewController];
}

- (void)setCurrentViewController: (HAViewController *) viewController {
    [self addChildViewController:viewController];
    [viewController.view setFrame:CGRectMake(0.0f, 70.0f, self.view.bounds.size.width, self.view.bounds.size.height - 60.0)];
    [self.view addSubview:viewController.view];
    [viewController didMoveToParentViewController:self];
    [self.navigationView setTitle:viewController.title];
}

- (void)popViewController {
    if (self.childViewControllers.count > 0) {
        [self removeLastViewController];
        [self.childViewControllers removeLastObject];
        if (self.childViewControllers.count > 0) {
            HAViewController *previous = [self.childViewControllers lastObject];
            [self setCurrentViewController:previous];
        }
    }
    [self.navigationView showBackButton:!(self.childViewControllers.count > 1)];
}

- (void)pushViewController:(HAViewController *)viewController {
    //remove previous
    [self removeLastViewController];
    viewController.flowDelegate = self;
    [self setCurrentViewController:viewController];
    [self.childViewControllers addObject:viewController];
    [self.navigationView showBackButton:!(self.childViewControllers.count > 1)];
}


@end
