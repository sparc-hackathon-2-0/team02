//
//  ClassifiedsViewController.m
//  Team02
//
//  Created by Jonathan Spohn on 8/25/12.
//  Copyright (c) 2012 League of Pantless Gentlemen. All rights reserved.
//

#import "ClassifiedsViewController.h"
#import "SlideShowController.h"

@interface ClassifiedsViewController ()

@property SlideShowController *slideShowController;

@end

@implementation ClassifiedsViewController
@synthesize scrollView = _scrollView;
@synthesize slideShowController = _slideShowController;

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
	// Do any additional setup after loading the view.
    
    NSArray *imageFilenames = [NSArray arrayWithObjects:@"ad-service-needed",@"ad-good-needed.png",@"ad-service-offered.png",@"ad-service-needed",@"ad-service-needed",@"ad-service-needed",@"ad-service-needed",@"ad-service-needed",@"ad-service-needed",@"ad-service-needed",@"ad-service-needed",nil];
    
    _slideShowController = [[SlideShowController alloc] initWithScrollView:_scrollView andImageFilenamesArray:imageFilenames andTimeInterval:5.0];
    
    [_slideShowController setDelegate:self];
    
}

- (void)viewDidUnload
{
    [self setScrollView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

-(void)segueToItem
{
    [self performSegueWithIdentifier:@"viewItem" sender:self];
}

@end
