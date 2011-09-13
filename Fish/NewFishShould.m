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

-(void)setUp
{
	aFish = [[Fish alloc] init];
}

-(void)tearDown
{
	[aFish release];
}

-(void)testHaveTimer
{
	STAssertNotNil(aFish.timer, @"");
}

-(void)testBeAbleToPause
{
	[aFish toggleTimer];
	STAssertNil(aFish.timer,@"");
	[aFish toggleTimer];
	STAssertNotNil(aFish.timer,@"");
}

-(void)testWhenHit_Rebound{
	//set variable
	aFish.XSpeed = 50;
	aFish.YSpeed = 30;
	
	//what should happen ---- .6 is the friction
	int resultX = -aFish.XSpeed;
	resultX *= .6;
	
	int resultY = -aFish.YSpeed;
	resultY *= .6;
	
	//call the method
	[aFish hit];
	
	//test the results
	STAssertEquals(resultX, (int)aFish.XSpeed, @"XSpeed did not get reversed. TestResult = %f  XSpeed = %f",resultX, (int)aFish.XSpeed);
	STAssertEquals(resultY, (int)aFish.YSpeed, @"YSpeed did not get reversed. TestResult = %f YSpeed = %f",resultY, (int)aFish.YSpeed);
}




@end
