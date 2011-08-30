//
//  FishViewController.m
//  Fish
//
//  Created by Daniel Loomb on 22/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FishViewController.h"
#import "LevelSelectViewController.h"
#import "GameViewController.h"
#import "AsthmapediaViewController.h"
#import "OptionsViewController.h"

@implementation FishViewController


-(IBAction)menuItemLevelSelect
{
	LevelSelectViewController * levelView = [[LevelSelectViewController alloc] initWithNibName:NULL bundle:NULL];
	
	[self presentModalViewController:levelView animated:NO];
}

-(IBAction)menuItemAsthmapedia
{
	AsthmapediaViewController * asthmapediaView = [[AsthmapediaViewController alloc] initWithNibName:NULL bundle:NULL];
	
	[self presentModalViewController:asthmapediaView animated:NO];
}

-(IBAction)menuItemOptions
{
	OptionsViewController * optionsView = [[OptionsViewController alloc] initWithNibName:NULL bundle:NULL];
	
	[self presentModalViewController:optionsView animated:NO];
}

-(IBAction)menuItemVisitAsthmaWaikato
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://waikatoasthma.co"]];
}


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	//Set the custom font for this views buttons
	[startButton.titleLabel setFont:[UIFont fontWithName:@"Suplexmentary Comic NC" size:36]];
	[optionsButton.titleLabel setFont:[UIFont fontWithName:@"Suplexmentary Comic NC" size:36]];
	[asthmapediaButton.titleLabel setFont:[UIFont fontWithName:@"Suplexmentary Comic NC" size:36]];	
	[asthmaWaikatoLabel setFont:[UIFont fontWithName:@"Suplexmentary Comic NC" size:36]];
	
	
	
    [super viewDidLoad];
}



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return NO;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
