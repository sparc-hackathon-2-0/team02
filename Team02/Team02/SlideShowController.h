//
//  SlideShowController.h
//  Mobile-Signin
//
//  Created by Jonathan Spohn on 7/3/12.
//  Copyright (c) 2012 Sparc. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SlideShowDelegate <NSObject>

-(void)segueToItem;

@end

@interface SlideShowController : NSObject{
    float pageNumberYouWantToGoTo;
    float maxPages;
    
}

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSNumber *timeInterval;
@property (nonatomic, strong) NSArray *imageFilenames;
@property (nonatomic,strong) id delegate;

- (id) initWithScrollView:(UIScrollView *)scrollView andImageFilenamesArray:(NSArray *)imageFilenames andTimeInterval:(float)timeInterval;

- (void) stopSlideShow;

- (void) setTapGesture:(BOOL)toggle;

- (void) goToPage:(int)page;

@end
