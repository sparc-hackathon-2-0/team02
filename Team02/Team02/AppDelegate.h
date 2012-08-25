//
//  AppDelegate.h
//  Team02
//
//  Created by Michael Vaughan on 8/25/12.
//  Copyright (c) 2012 League of Pantless Gentlemen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationMonitoringService.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    LocationMonitoringService *__locationMonitoringService;
}

@property (strong, nonatomic) UIWindow *window;

-(LocationMonitoringService *) locationMonitoringService;

@end
