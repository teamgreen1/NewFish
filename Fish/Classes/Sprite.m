//
//  Sprite.m
//  Fish
//
//  Created by Benjamin Squires on 6/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Sprite.h"
#import "Fish.h"
#import <stdlib.h>


@implementation Sprite
@synthesize XSpeed;
@synthesize YSpeed;

@synthesize XPos;
@synthesize YPos;
@synthesize randomNum;

//@synthesize timer;

float screen_width = 768;
float screen_height = 1002;


-(void) update: (Fish *)aFish{
	
	
	XPos = self.center.x + xdir;
	YPos = self.center.y + ydir;
	
	
	if(XPos > screen_width || XPos <0){
		xdir = -xdir;
	}
	if(YPos > screen_height || YPos < 0){
		ydir = -ydir;
	}
	
	
	[self setCenter:CGPointMake(XPos, YPos)];
}

-(void)hit{
	self.hidden = TRUE;
}

-(void)rebound{
	xdir = -xdir;
	
	XPos = self.center.x + xdir;
	YPos = self.center.y + ydir;
	
	[self setCenter:CGPointMake(XPos, YPos)];
}


/*
 * A method to pause the timer
 */
/*
 -(void)toggleTimer{
 if(self.timer == nil){//if the timer is currently empty then set it
 self.timer = [NSTimer scheduledTimerWithTimeInterval:1/30.0 target:self selector:@selector(updateMite) userInfo:nil repeats:true];
 }
 else{//else stop the timer 
 [self.timer invalidate];
 self.timer = nil;
 }
 }
 */


@end
