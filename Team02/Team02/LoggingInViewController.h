//
//  LoggingInViewController.h
//  Team02
//
//  Created by Jonathan Spohn on 8/25/12.
//  Copyright (c) 2012 League of Pantless Gentlemen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoggingDelegate <NSObject>

-(void)dismissAll;

@end

@interface LoggingInViewController : UIViewController

@property (nonatomic, strong) id delegate;

@end
