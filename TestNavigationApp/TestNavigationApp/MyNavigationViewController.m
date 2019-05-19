//
//  ViewController.m
//  TestNavigationApp
//
//  Created by Hanna Rybakova on 5/2/19.
//  Copyright © 2019 None. All rights reserved.
//

#import "MyNavigationViewController.h"
#import "HAViewController.h"

@interface MyNavigationViewController ()
@property (nonatomic, retain, readwrite) NSMutableArray *childViewControllers;
@property (nonatomic, retain) UIButton *backButton;
@end

@implementation MyNavigationViewController

@synthesize backButton;

- (void)dealloc
{
    self.backButton = nil;
    self.childViewControllers = nil;
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.childViewControllers = [[NSMutableArray alloc] init];
    
    UIImage* backImage = [UIImage imageNamed:@"back.png"];
    CGRect frame = CGRectMake(15,35, 25,25);
    
    self.backButton = [[UIButton alloc] initWithFrame:frame];
    [self.backButton setBackgroundImage:backImage forState:UIControlStateNormal];
    
    [self.backButton addTarget:self action:@selector(pressBack)
              forControlEvents:UIControlEventTouchUpInside];
    [self.backButton setShowsTouchWhenHighlighted:YES];
    [self.view addSubview:self.backButton];
}

- (void)pressBack {
    [self popViewController];
    NSLog(@"Print back");
}

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
    [self.backButton setHidden: !(self.childViewControllers.count > 1)];
}

- (void)pushViewController:(HAViewController *)viewController {
    //remove previous
    [self removeLastViewController];
    viewController.flowDelegate = self;
    [self setCurrentViewController:viewController];
    [self.childViewControllers addObject:viewController];
    [self.backButton setHidden:!(self.childViewControllers.count > 1)];
}


@end
