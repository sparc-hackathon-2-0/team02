//
//  ProfileViewController.m
//  Team02
//
//  Created by Jonathan Spohn on 8/25/12.
//  Copyright (c) 2012 League of Pantless Gentlemen. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()
@property UIImagePickerController *picker;
@property (nonatomic, retain) UIPopoverController *pickerPopover;
@end

@implementation ProfileViewController
@synthesize imageView = _imageView;
@synthesize picker = _picker;
@synthesize pickerPopover = _pickerPopover;

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
    
    _imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self action:@selector(imageClicked:)];
    
    tgr.delegate = self;
    [_imageView addGestureRecognizer:tgr];
}


- (IBAction)imageClicked:(UITapGestureRecognizer *)tapGesture {
    
    //create the picker and set it's delegate
    self.picker = [[UIImagePickerController alloc] init];
    self.picker.delegate = self;
    
    //optional means to eneable a camera if it is present
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        
        self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self.picker setCameraDevice:UIImagePickerControllerCameraDeviceFront];
        
    }else{
        
        self.picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
    }
    
    self.pickerPopover = [[UIPopoverController alloc]
                          initWithContentViewController:self.picker];
    
    [self.pickerPopover presentPopoverFromRect:CGRectMake(0.0, 0.0, 800, 1.0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

//when an image has been selected this will run
- (void)imagePickerController:(UIImagePickerController *) Picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    _imageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    [self.pickerPopover dismissPopoverAnimated:YES];
    
}

- (void)viewDidUnload
{
    [self setImageView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
