//
//  AnimalFur.m
//  Fish
//
//  Created by Daniel Loomb on 25/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AnimalFur.h"


@implementation AnimalFur

@synthesize health;

-(id)init{
	if(self){
		self.health = 100;
	}
	return self;
}


@end
