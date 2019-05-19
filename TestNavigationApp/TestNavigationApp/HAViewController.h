//
//  HAViewController.h
//  TestNavigationApp
//
//  Created by Hanna Rybakova on 5/20/19.
//  Copyright © 2019 None. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationProtocolDelegate.h"

@interface HAViewController : UIViewController

@property (nonatomic,weak) id<NavigationProtocolDelegate> flowDelegate;

@end
