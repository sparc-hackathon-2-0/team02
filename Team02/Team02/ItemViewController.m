//
//  ItemViewController.m
//  Team02
//
//  Created by Jonathan Spohn on 8/25/12.
//  Copyright (c) 2012 League of Pantless Gentlemen. All rights reserved.
//

#import "ItemViewController.h"

@interface ItemViewController ()

@end

@implementation ItemViewController

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

- (IBAction)emailPressed:(id)sender {
    [self createEmailUsing];
}

- (void)createEmailUsing
{
    //  Getting location of pdf
//    self.pageSize = CGSizeMake(612, 792);
//    NSString *fileName = [NSString stringWithFormat:@"%@.pdf", self.guestName];
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsDirectory = [paths objectAtIndex:0];
//    NSString *pdfFileName = [documentsDirectory stringByAppendingPathComponent:fileName];
    
    MFMailComposeViewController *mailPicker = [[MFMailComposeViewController alloc] init];
    mailPicker.mailComposeDelegate = self;
    //[mailPicker setSubject:[NSString stringWithFormat:@"%@ has arrived!", self.guestItem.firstName]];
    
    //  Setup who the email is going to
    NSArray *toRecipients = [NSArray arrayWithObject:[NSString stringWithFormat:@"matt.brooks@sparcedge.com"]];
    //NSArray *ccRecipients = [NSArray arrayWithObject:[NSString stringWithFormat:@"%@@vtext.com", [pointOfContact objectForKey:@"cellPhone"]]];
    
    [mailPicker setToRecipients:toRecipients];
    //[mailPicker setCcRecipients:ccRecipients];
    
    [mailPicker setMessageBody:[NSString stringWithFormat:@"<p>Hello Matt Brooks,</p> <p>Michael Vaughn would like to barter with you</p>"] isHTML:YES];
    
    //NSData *pdfData = [NSData dataWithContentsOfFile:pdfFileName];
    //[mailPicker addAttachmentData:pdfData mimeType:@"attachment/pdf" fileName:fileName];
    
    [self presentModalViewController:mailPicker animated:YES];
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    //  Notifies users about errors associated with interface
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Result: canceled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Result: saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Result: sent");
            //[self sendSMSMessage];
            //[self.emailContactButton setHidden:YES];
            
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Result: failed");
            break;
        default:
            NSLog(@"Result: not sent");
            break;
    }
    [self dismissModalViewControllerAnimated:YES];
}
@end
