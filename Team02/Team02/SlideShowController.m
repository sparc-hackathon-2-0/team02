//
//  SlideShowController.m
//  Mobile-Signin
//
//  Created by Jonathan Spohn on 7/3/12.
//  Copyright (c) 2012 Sparc. All rights reserved.
//

#import "SlideShowController.h"

@implementation SlideShowController

@synthesize timer = _timer;
@synthesize scrollView = _scrollView;
@synthesize timeInterval = _timeInterval;
@synthesize imageFilenames = _imageFilenames;
@synthesize delegate = _delegate;

- (id) initWithScrollView:(UIScrollView *)scrollView andImageFilenamesArray:(NSArray *)imageFilenames andTimeInterval:(float)timeInterval
{
    //point class properties to objects passed in by reference
    _timeInterval = [[NSNumber alloc] initWithFloat:timeInterval];
    _imageFilenames = imageFilenames;
    _scrollView = scrollView;
    
    //create an offset
    CGFloat contentOffset = 0.0f;
    CGFloat YcontentOffset = 0.0f;

    //make sure paging is enabled
    [_scrollView setPagingEnabled:YES];
    
    //for each image, lets add it to the UIScrollView and increase the offset accordingly
    int count = 0;
    for (NSString *singleImageFilename in imageFilenames) 
    {
        count++;
        if(count % 3 == 0){
            YcontentOffset += _scrollView.frame.size.height;
            contentOffset = 0.0f;
        }
        
        CGRect imageViewFrame = CGRectMake(contentOffset / 3, YcontentOffset / 3,_scrollView.frame.size.width/3,_scrollView.frame.size.height / 3);
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageViewFrame];
        imageView.image = [UIImage imageNamed:singleImageFilename];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [imageView setTag:count];
        
        //UIImageView *rowsBackground = [[UIImageView alloc] initWithImage:[self scaleAndRotateImage:[UIImage imageNamed:@"mylongbackground.png"]]];
        //rowsBackground.userInteractionEnabled = YES;
        
        //create button
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = [imageView frame];
        btn.bounds = [imageView bounds];
        [btn setImage:[imageView image] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
        
        //add "stuff" to scrolling area
        //[scrollView addSubview:rowsBackground];
        [_scrollView addSubview:btn];
        
        //imageView.contentMode = UIViewContentModeScaleAspectFill;
        //[_scrollView addSubview:imageView];
        contentOffset += _scrollView.frame.size.height;
        _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width, contentOffset);
        
        
        
    }
    
    //set the max pages to number of images
    pageNumberYouWantToGoTo = 0;
    maxPages = [imageFilenames count];
    //_timer = [NSTimer scheduledTimerWithTimeInterval:_timeInterval.floatValue target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    
    //return self reference 
    return self;
}

-(void)buttonClick
{
    [_delegate segueToItem];
}

- (void) stopSlideShow
{
    //stop the timer
    [_timer invalidate];
    [self setTimer:nil];
}

- (void) onTimer {
    
    // Updates the current page
    pageNumberYouWantToGoTo += 1;
    
    CGRect frame = _scrollView.frame;
    
    //scroll to the correct page, reseting at the end
    //TODO make this loop
    if( pageNumberYouWantToGoTo < maxPages ){
        frame.origin.x = frame.size.width * pageNumberYouWantToGoTo;
        frame.origin.y = 0;
        [_scrollView scrollRectToVisible:frame animated:YES];
    }else{
        pageNumberYouWantToGoTo = 0;
        frame.origin.x = frame.size.width * pageNumberYouWantToGoTo;
        frame.origin.y = 0;
        [_scrollView scrollRectToVisible:frame animated:NO];
        
        //make last image, the first image and restart
        
        
    }
    
}

- (void) goToPage:(int)page {
    
    
    CGRect frame = _scrollView.frame;
    
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [_scrollView scrollRectToVisible:frame animated:YES];
        
}

- (void) setTapGesture:(BOOL)toggle
{
    //Not the best code - adding when turned on, then disabled all when turned off
    if(toggle){
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTapped:)];
        
        [_scrollView addGestureRecognizer:tapGesture];
    }else{
        for( UIGestureRecognizer *gr in [_scrollView gestureRecognizers] ){
            [gr setEnabled:NO];
        }
    }

}

- (void)imageTapped:(UIGestureRecognizer *)gesture
{
    NSLog(@"image tapped");
    
	//NSString *imageName = [_imageFilenames objectAtIndex:pageNumberYouWantToGoTo];
    
    //NSLog(@"%@", imageName);
    
    
    UIImageView* test = gesture.view;
    
    NSLog(@"%i",[test tag]);
    
    if(gesture.state == UIGestureRecognizerStateEnded)
    {
         NSLog(@"image ended");
    }
}


- (void) dealloc
{
    [self stopSlideShow];
}


@end
