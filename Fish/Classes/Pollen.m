//
//  DustMite.m
//  Fish
//
//  Created by Daniel Loomb on 23/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Pollen.h"

@implementation Pollen




float pollen_radius = 30;


- (id)init :(int)randomX : (int)randomY {
    self = [super initWithImage:[UIImage imageNamed:@"pollen.png"]];
    if(self){
		
		XPos = randomX;
		YPos = randomY;
        [self setFrame:CGRectMake(XPos, YPos, pollen_radius*2, pollen_radius*2)];
		
		
		self.chooseTarget;
		
		
    }
    return self;
}

@end