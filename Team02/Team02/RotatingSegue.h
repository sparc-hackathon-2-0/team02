//
//  RotatingSegue.h
//  Team02
//
//  Created by Jonathan Spohn on 8/25/12.
//  Copyright (c) 2012 League of Pantless Gentlemen. All rights reserved.
//

#import <Foundation/Foundation.h>

// Two-way segue allows you to move in either direction
// Informal delegate sends segueDidComplete message

@interface RotatingSegue : UIStoryboardSegue
{
    CALayer *transformationLayer;
    UIView __weak *hostView;
}
@property (assign) BOOL goesForward;
@property (assign) UIViewController *delegate;
@end
