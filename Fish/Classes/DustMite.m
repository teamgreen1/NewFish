//
//  DustMite.m
//  Fish
//
//  Created by Daniel Loomb on 23/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DustMite.h"

@implementation DustMite


float sprite_radius = 25;


- (id)init :(int)randomX : (int)randomY {
    self = [super initWithImage:[UIImage imageNamed:@"dustMite.png"]];
    if(self){
		
        [self setFrame:CGRectMake(0, 0, sprite_radius*3, sprite_radius*2)];
		
		
		/*
		 * Deals with creating different moving mites
		 *
		 */
		
		xdir = randomX;
		ydir = randomY;
		
		//[self toggleTimer];
    }
    return self;
}

@end