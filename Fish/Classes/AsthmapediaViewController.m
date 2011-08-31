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
	
	//set up the scroll view to behave how we want.
	[scrollView setScrollEnabled:YES];
	int contentSize = (768 * 6);
	[scrollView setContentSize:CGSizeMake(contentSize, 360)];
	[scrollView setClipsToBounds:FALSE];
	[scrollView setPagingEnabled:YES];
	[scrollView setShowsHorizontalScrollIndicator:NO];
	
	
	//call the method to add each image to the scroll view
	/***************** Could really use a loop here ******************/
	[self addImageAsSubView:@"asthmapediaAnimalFur.png" :0 :scrollView];	
	[self addImageAsSubView:@"asthmapediaCold.png" : 1 :scrollView];	
	[self addImageAsSubView:@"asthmapediaDustMite.png" :2 :scrollView];	
	[self addImageAsSubView:@"asthmapediaFluVirus.png" :3 :scrollView];	
	[self addImageAsSubView:@"asthmapediaPollen.png" :4 :scrollView];	
	[self addImageAsSubView:@"asthmapediaSmoke.png" :5 :scrollView];
		
	
    [super viewDidLoad];
}


/*Creator = Daniel
 *
 * A method to add the asthmapedia images to the UIScroll view
 */
-(void)addImageAsSubView:(NSString *)image :(int )location :(UIScrollView *)scroller
{
	//the variables
	int imageW = 477;
	int imageH = 831;
	int gap = 384;
	
	int xcoord;
	if (location == 0) {//if first then just make it on gap away from edge of screen
		xcoord = gap;
	}
	else {//else make it a gap plus the distance along the screen it will be located.
		xcoord = gap + (location * (2*gap));
	}
	

	CGPoint point = CGPointMake(xcoord,400);//the point to draw the image
	
	UIImage *MyImage = [UIImage imageNamed:image];//the image to draw
	
	UIImageView *imageView = [[UIImageView alloc] initWithImage:MyImage];//the view to hold the image
	
	imageView.frame = CGRectMake(0, 0, imageW, imageH);//the size to draw the image
	
	imageView.center = point;//set the center of the image to be equal to the center of the screen
	
	[scroller addSubview:imageView];//add the image to the screen
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
