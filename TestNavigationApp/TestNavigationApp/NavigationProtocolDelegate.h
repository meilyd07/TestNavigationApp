//
//  NavigationProtocol.h
//  TestNavigationApp
//
//  Created by Hanna Rybakova on 5/3/19.
//  Copyright © 2019 None. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NavigationProtocolDelegate
@required
- (void)pushViewController:(UIViewController*)viewController;
@end

@protocol NavigationProtocol
@required
@property (nonatomic,weak) id<NavigationProtocolDelegate> flowDelegate;
@end
