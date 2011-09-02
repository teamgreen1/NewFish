//
//  DustMite.m
//  Fish
//
//  Created by Daniel Loomb on 23/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DustMite.h"


@implementation DustMite
@synthesize XSpeed;
@synthesize YSpeed;

@synthesize XPos;
@synthesize YPos;

@synthesize timer;

float screen_width = 768;
float screen_height = 1002;
float mite_radius = 25;



- (id)init {
    self = [super initWithImage:[UIImage imageNamed:@"dustMite.png"]];
    if(self){
		
        [self setFrame:CGRectMake(0, 0, mite_radius*3, mite_radius*2)];
        xdir = 5;
		ydir = 5;
		[self toggleTimer];
    }
    return self;
}

-(void) updateMite
{
	XPos = self.center.x + xdir;
	YPos = self.center.y + ydir;
	
	
	if(XPos > screen_width || XPos <0){
		xdir = xdir *-1;
	}
	if(YPos > screen_height || YPos < 0){
		ydir = ydir *-1;
	}

	
	[self setCenter:CGPointMake(XPos, YPos)];
}

-(void)hit
{
	self.hidden = TRUE;
}


/*
 * A method to pause the timer
 */
-(void)toggleTimer
{
	if(self.timer == nil){//if the timer is currently empty then set it
			self.timer = [NSTimer scheduledTimerWithTimeInterval:1/30.0 target:self selector:@selector(updateMite) userInfo:nil repeats:true];
	}
	else{//else stop the timer 
		[self.timer invalidate];
		self.timer = nil;
	}
}

@end
