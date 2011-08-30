    //
//  AsthmapediaViewController.m
//  Fish
//
//  Created by Daniel Loomb on 22/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AsthmapediaViewController.h"
#import "FishViewController.h"


@implementation AsthmapediaViewController

@synthesize scrollView;

-(IBAction)back
{
	FishViewController *menuView = [[FishViewController alloc] initWithNibName:NULL bundle:NULL];
	
	[self presentModalViewController:menuView animated:NO];
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

	[scrollView setScrollEnabled:YES];
	[scrollView setContentSize:CGSizeMake(5650, 360)];
	[scrollView setClipsToBounds:FALSE];
	
	CGPoint point = CGPointMake(375,400);
	UIImage *MyImage = [UIImage imageNamed:@"asthmapedia_placeholder.jpg"];
	UIImageView *imageView = [[UIImageView alloc] initWithImage:MyImage];
	imageView.frame = CGRectMake(0, 0, 700, 875);
	imageView.center = point;
	[scrollView addSubview:imageView];
	[imageView release]; 
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
