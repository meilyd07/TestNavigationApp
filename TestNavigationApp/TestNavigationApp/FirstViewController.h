//
//  FirstViewController.h
//  TestNavigationApp
//
//  Created by Hanna Rybakova on 5/3/19.
//  Copyright © 2019 None. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationProtocolDelegate.h"

@interface FirstViewController : UIViewController<NavigationProtocol>
@property (nonatomic,weak) id<NavigationProtocolDelegate> flowDelegate;
@end
