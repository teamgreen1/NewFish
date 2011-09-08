//
//  untitled.m
//  Fish
//
//  Created by Billy-Jo Hunia on 3/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PreventerLining.h"


@implementation PreventerLining

@synthesize YPos;
@synthesize XPos;
@synthesize Health;
@synthesize HasBeenHit;

int timer;
float lining_radius = 25;

-(void)hit{
	
	Health = Health - 1;
	HasBeenHit = true;
	//timer = 30;
}

- (id)init {
    self = [super initWithImage:[UIImage imageNamed:@"preventerBubbleGreen.png"]];
	
	if(self){
		
	[self setFrame:CGRectMake(0, 0, lining_radius*2, lining_radius*2)];
	
	self.Health = 2;
	//timer = 0;
	self.HasBeenHit = false;
	}
	
    return self;
}

-(void)updateLining{
	XPos = self.center.x;
	YPos = self.center.y;
	
	//if(timer != 0){
		//timer = timer - 1;
	//}
	//else{
		//HasBeenHit = false;
	//}
}

-(void)isDamage{
	[self setImage:[UIImage imageNamed:@"preventerBubbleRed.png"]];
}


@end
