#import "LocationMonitoringService.h"

@implementation LocationMonitoringService

@synthesize locationManager;
@synthesize startTime;
@synthesize foundLocation;
@synthesize currentLocation;
@synthesize delegate;

-(id) init {
    if (self = [super init])
    {
        if ( ![CLLocationManager locationServicesEnabled] ) {
            NSLog(@"Location Services are not enabled!");
        } else {
            [self setLocationManager:[[CLLocationManager alloc] init]];
            [[self locationManager] setDelegate:self];
            [[self locationManager] setDesiredAccuracy:kCLLocationAccuracyBest];
            [self setStartTime:[NSDate date]];
            [self setFoundLocation:NO];
        }
    }
    
    return self;

}


-(void) startMonitoringLocation {
    [[self locationManager] startUpdatingLocation];
}

-(BOOL) locationServicesEnabled {
    return [CLLocationManager locationServicesEnabled];
}


- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog( @"error: %@", [error localizedDescription] );
    [manager stopUpdatingLocation];
}


-(void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    if ( ![self foundLocation] && ([[newLocation timestamp] timeIntervalSinceDate:[self startTime]] > 20 ) ) {
        NSLog(@"Took too long to get best accuracy location, just using what I've got.");
        [manager stopUpdatingLocation];
        [self setFoundLocation:YES];
        [self setCurrentLocation:[newLocation coordinate]];
        [self.delegate performSelector:@selector(locationMonitoringServiceFoundLocation:) withObject:self];
        return;
    }
    CLLocationAccuracy acc = [newLocation horizontalAccuracy];
    NSLog(@"%f", acc);
    if (acc > 70) {
        // wait for better accuracy
        return;
    }
    // if we get here, we have an accurate location
    [manager stopUpdatingLocation];
    [self setFoundLocation:YES];
    [self setCurrentLocation:[newLocation coordinate]];
    [self.delegate performSelector:@selector(locationMonitoringServiceFoundLocation:) withObject:self];

}


@end
