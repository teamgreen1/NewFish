    //
//  OptionsViewController.m
//  Fish
//
//  Created by Daniel Loomb on 29/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OptionsViewController.h"
#import "FishViewController.h"
#import "CreditsViewController.h"


@implementation OptionsViewController



/*
 *  What happens when the back button is pressed
 */
-(IBAction)back
{
	FishViewController *menuView = [[FishViewController alloc] initWithNibName:NULL bundle:NULL];
	
	[self presentModalViewController:menuView animated:NO];
}


/*
 * What happens when the reset button is pressed
 */
-(IBAction)reset
{
	alertWithOkButton = [[UIAlertView alloc] initWithTitle:@"Work in Progress"
												   message:@"This is not yet working. Sorry." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	
	[alertWithOkButton show];
	[alertWithOkButton release];

}





/*
 * What happens when the sounds setting button is pressed
 */
-(IBAction)sounds
{
	alertWithOkButton = [[UIAlertView alloc] initWithTitle:@"Work in Progress"
												   message:@"This is not yet working. Sorry." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	
	[alertWithOkButton show];
	[alertWithOkButton release];
}


/*
 * What happens when the music setting button is pressed
 */
-(IBAction)music
{
	alertWithOkButton = [[UIAlertView alloc] initWithTitle:@"Work in Progress"
												   message:@"This is not yet working. Sorry." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	
	[alertWithOkButton show];
	[alertWithOkButton release];
}


/*
 * What happens when the credits button is pressed
 */
-(IBAction)credits
{
	CreditsViewController *creditView = [[CreditsViewController alloc] initWithNibName:NULL bundle:NULL];
	
	[self presentModalViewController:creditView animated:NO];
	
}

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[soundsButton.titleLabel setFont:[UIFont fontWithName:@"Suplexmentary Comic NC" size:36]];
	[musicButton.titleLabel setFont:[UIFont fontWithName:@"Suplexmentary Comic NC" size:36]];
	[resetButton.titleLabel setFont:[UIFont fontWithName:@"Suplexmentary Comic NC" size:36]];
	[creditsButton.titleLabel setFont:[UIFont fontWithName:@"Suplexmentary Comic NC" size:36]];
    [super viewDidLoad];
}





- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return NO;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
