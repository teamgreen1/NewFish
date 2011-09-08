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
	float k = .1;
    float restingDistance = 200;
	float speed = 5;
    
	
	
	if ((int)XPos > (10 - targetX) && (int)XPos < (10 + targetX) && (int)YPos > (10 - targetY) && (int)YPos < (10 + targetY)) {
		
		self.chooseTarget;
	}
	
	

	
	float dxTarget = XPos - targetX;
	float dyTarget = YPos - targetY;
	
	direction = atan2(dyTarget, dxTarget);
	

	
	float dxFish =  aFish.XPos - YPos;
	float dyFish =  aFish.YPos - YPos;
	
	float distance = sqrtf(dxFish*dxFish + dyFish*dyFish);
	
	float ddx = 0;
    float ddy = 0;
    if(distance < restingDistance)
    {
        ddx = k*(distance-restingDistance)*(dxFish/distance);
        ddy = k*(distance-restingDistance)*(dyFish/distance);
    }

	XPos -= speed * cos(direction);
	YPos -= speed * sin(direction);
	XPos += ddx;
	YPos += ddy;
	
	[self setCenter:CGPointMake(XPos, YPos)];
}

-(void) chooseTarget{
	targetX = arc4random() % 530 + 150;
	targetY = arc4random() % 804 + 150;
}


@end
