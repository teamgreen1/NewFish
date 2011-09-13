//
//  Sprite.m
//  Fish
//
//  Created by Benjamin Squires on 6/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Sprite.h"
#import "Fish.h"
#import "Pollen.h"
#import <stdlib.h>
#import <math.h>



@implementation Sprite
@synthesize XSpeed;
@synthesize YSpeed;

@synthesize XPos;
@synthesize YPos;
@synthesize randomNum;
@synthesize direction;

//@synthesize timer;

float screen_width = 768;
float screen_height = 1002;



-(void) update: (Fish *)aFish{
	
	[self move:aFish];

}

-(void)hit{
	self.hidden = TRUE;
}


-(void)rebound{
	direction = -direction;
	
	XPos = self.center.x + direction;
	YPos = self.center.y + direction;
	 
}


-(void) move: (Fish *) aFish{
	
	float k = .05;					//strength of the avoidance spring
    float restingDistance = 300;	//distance the spring starts to take effect
	float speed = 3;				//the speed to travel.
    
	
	//if the trigger has almost reached its target choose a new one
	if ((int)XPos > (10 - targetX) && (int)XPos < (10 + targetX) && (int)YPos > (10 - targetY) && (int)YPos < (10 + targetY)) {
		
		self.chooseTarget;
	}
	
	
	

	//Works out the direction to head to get to the target
	float dxTarget = XPos - targetX;
	float dyTarget = YPos - targetY;	
	direction = atan2(dyTarget, dxTarget);
	
	//works out the speed to apply for the given direction
	XPos -= speed * cos(direction);
	YPos -= speed * sin(direction);
	
	
	//works out the distance between the Fish and the trigger
	float dxFish =  aFish.XPos - XPos;
	float dyFish =  aFish.YPos - YPos;	
	float distance = sqrtf(dxFish*dxFish + dyFish*dyFish);

	if ([self isKindOfClass:[Pollen class]]) {		
		//adds avoidance to the trigger if it is close to the fish.
		float ddx = 0;
		float ddy = 0;
		if(distance < restingDistance)
		{
			ddx = k*(distance-restingDistance)*(dxFish/distance);
			ddy = k*(distance-restingDistance)*(dyFish/distance);
		}		
		//adds teh avoidance to the current position
		XPos += ddx;
		YPos += ddy;
	}
	
	if (XPos < 150) {
		XPos = 150;
	}
	if(XPos > 618){
		XPos = 618;
	}
	if (YPos < 150) {
		YPos = 150;
	}
	if (YPos > 854) {
		YPos = 854;
	}
	
	
	//draws the result to the screen
	[self setCenter:CGPointMake(XPos, YPos)];
}

-(void) chooseTarget{
	targetX = arc4random() % 468 + 150;
	targetY = arc4random() % 704 + 150;
}


@end
