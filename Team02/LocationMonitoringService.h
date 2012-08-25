
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface LocationMonitoringService : NSObject <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) NSDate *startTime;
@property BOOL foundLocation;
@property CLLocationCoordinate2D currentLocation;

-(BOOL) locationServicesEnabled;

@end
