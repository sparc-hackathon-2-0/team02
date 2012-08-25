//
//  CategoriesViewController.m
//  Team02
//
//  Created by Jonathan Spohn on 8/25/12.
//  Copyright (c) 2012 League of Pantless Gentlemen. All rights reserved.
//

#import "CategoriesViewController.h"

@interface CategoriesViewController ()

@end

@implementation CategoriesViewController

@synthesize managedObjectContext = _managedObjectContext;
@synthesize appDelegate = _appDelegate;

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
    _appDelegate = [[UIApplication sharedApplication] delegate];
    self.managedObjectContext = _appDelegate.managedObjectContext;
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

-(void)createFavoriteWithString:(NSString *)name
{
    Favorite *fav = [NSEntityDescription entityForName:@"Favorite" inManagedObjectContext:self.managedObjectContext];
    [fav setName:name];
    
    [self.managedObjectContext save:nil];
}

-(void)deleteFavorite:(NSString *)name
{
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Document" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(name == %@)", name];
    [fetchRequest setPredicate:predicate];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Master"];
    
	NSError *error = nil;
	if (![aFetchedResultsController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    
    [self.managedObjectContext deleteObject:[aFetchedResultsController objectAtIndexPath:[NSIndexPath indexPathWithIndex:0]]];
    
    [self.managedObjectContext save:nil];
    
    
}

- (IBAction)goods:(id)sender {
    [self performSegueWithIdentifier:@"categoriesToClass" sender:self];
}

- (IBAction)realEstate:(id)sender {
    [self performSegueWithIdentifier:@"categoriesToClass" sender:self];
}

- (IBAction)services:(id)sender {
    [self performSegueWithIdentifier:@"categoriesToClass" sender:self];
}

@end
