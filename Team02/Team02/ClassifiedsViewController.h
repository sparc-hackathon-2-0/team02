//
//  ClassifiedsViewController.h
//  Team02
//
//  Created by Jonathan Spohn on 8/25/12.
//  Copyright (c) 2012 League of Pantless Gentlemen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideShowController.h"

@interface ClassifiedsViewController : UIViewController<SlideShowDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end
