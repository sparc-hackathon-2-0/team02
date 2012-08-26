//
//  LocalViewController.m
//  Team02
//
//  Created by Jonathan Spohn on 8/25/12.
//  Copyright (c) 2012 League of Pantless Gentlemen. All rights reserved.
//

#import "LocalViewController.h"
#import "LocationMonitoringService.h"
#import "MyLineDrawingView.h"
#import "AppDelegate.h"

@implementation LocalViewController


@synthesize mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	LocationMonitoringService *locationMonitoringService = [(AppDelegate *)[[UIApplication sharedApplication] delegate] locationMonitoringService];
    [locationMonitoringService setDelegate:self];
    [locationMonitoringService startMonitoringLocation];
    MyLineDrawingView *lineDrawingView = [[MyLineDrawingView alloc] initWithFrame:self.view.frame];
    lineDrawingView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    [lineDrawingView setDelegate:self];
    [mapView addSubview:lineDrawingView];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

-(void) locationMonitoringServiceFoundLocation: (LocationMonitoringService *) locationMonitoringService {
    if ( [locationMonitoringService foundLocation] ) {
        MKCoordinateRegion reg = MKCoordinateRegionMakeWithDistance([locationMonitoringService currentLocation], 30000, 30000);
        [[self mapView] setRegion:reg];
        MKPointAnnotation* ann = [[MKPointAnnotation alloc] init];
        [ann setCoordinate:[locationMonitoringService currentLocation]];
        [[self mapView] addAnnotation:ann];
    }
    CGPoint point = [self.mapView convertCoordinate:[locationMonitoringService currentLocation] toPointToView:nil];
    NSLog(@"%f, %f",point.x, point.y);
    
}

-(void) drawingFinished:(MyLineDrawingView *) lineDrawingView {

    SkillsDao *skillsDao = [(AppDelegate *)[[UIApplication sharedApplication] delegate] skillsDao];
    [[skillsDao getSkills] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ( [lineDrawingView insidePolygon:[mapView convertCoordinate:[obj coordinate] toPointToView:nil] ]){
            MKPointAnnotation* ann = [[MKPointAnnotation alloc] init];
            [ann setCoordinate:[obj coordinate]];
            [[self mapView] addAnnotation:ann];
        }
        
    }];
    
}

@end
