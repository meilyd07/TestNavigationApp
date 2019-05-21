//
//  NavigationView.h
//  TestNavigationApp
//
//  Created by Hanna Rybakova on 5/20/19.
//  Copyright © 2019 None. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^VoidBlock)(void);

@interface NavigationView : UIView
{
        VoidBlock handler;
}

@property(readwrite, copy) VoidBlock handler;
- (void)showBackButton:(BOOL)hidden;
- (void)setTitle:(NSString *)stringText;
@end

