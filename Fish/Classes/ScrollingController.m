//
//  ScrollingController.m
//  Fish
//
//  Created by  on 31/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ScrollingController.h"


@implementation ScrollingController

/*Creator = Daniel
 *
 * A method to add the asthmapedia images to the UIScroll view
 */
-(void)addImageAsSubView:(NSString *)image :(int )location :(UIScrollView *)scroller
{
	//the variables
	int imageW = 447;
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


@end
