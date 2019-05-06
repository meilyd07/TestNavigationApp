//
//  MyNavigationViewController.h
//  TestNavigationApp
//
//  Created by Hanna Rybakova on 5/2/19.
//  Copyright © 2019 None. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationProtocolDelegate.h"

@interface MyNavigationViewController : UIViewController<NavigationProtocolDelegate>
@property (nonatomic, retain) NSString *titleView;
@property (nonatomic, retain, readonly) NSMutableArray *childViewControllers;

- (void)popViewController;
- (void)pushViewController:(UIViewController*)viewController;
@end

