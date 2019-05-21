//
//  NavigationView.m
//  TestNavigationApp
//
//  Created by Hanna Rybakova on 5/20/19.
//  Copyright © 2019 None. All rights reserved.
//

#import "NavigationView.h"

@interface NavigationView()
@property (nonatomic, retain) UIButton *backButton;
@property (nonatomic, retain) UILabel *titleLabel;
@end

@implementation NavigationView
@synthesize handler;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImage* backImage = [UIImage imageNamed:@"back.png"];
        CGRect frame = CGRectMake(15,35, 25,25);
        
        self.backButton = [[UIButton alloc] initWithFrame:frame];
        [self.backButton setBackgroundImage:backImage forState:UIControlStateNormal];
        
        [self.backButton addTarget:self action:@selector(pressBack)
                  forControlEvents:UIControlEventTouchUpInside];
        [self.backButton setShowsTouchWhenHighlighted:YES];
        [self addSubview:self.backButton];
        
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 35, 200, 25)];
        self.titleLabel.text = @"";
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void)dealloc
{
    self.backButton = nil;
    self.titleLabel = nil;
    [handler release];
    [super dealloc];
}

- (void)showBackButton:(BOOL)hidden {
    [self.backButton setHidden:hidden];
}

- (void)setTitle:(NSString *)stringText {
    [self.titleLabel setText:stringText];
}

- (void)pressBack {
    handler();
    NSLog(@"Print back");
}

@end
