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

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

-(LocationMonitoringService *) locationMonitoringService;

@end
