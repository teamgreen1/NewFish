//
//  NewFishShould.m
//  Fish
//
//  Created by Daniel Loomb on 30/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NewFishShould.h"
#import "Fish.h"


@implementation NewFishShould


-(void)testHaveTimer
{
	Fish *aFish = [[Fish alloc]init];
	STAssertNotNil(aFish.timer, @"");
	[aFish release];
}

-(void)testBeAbleToPause
{
	Fish *aFish = [[Fish alloc] init];
	[aFish toggleTimer];
	STAssertNil(aFish.timer,@"");
	[aFish toggleTimer];
	STAssertNotNil(aFish.timer,@"");
	[aFish release];
}


@end
