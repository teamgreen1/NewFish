//
//  NewDustMiteShould.m
//  Fish
//
//  Created by Daniel Loomb on 30/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NewDustMiteShould.h"
#import "DustMite.h"

@implementation NewDustMiteShould

-(void)setUp
{
		aMite = [[DustMite alloc] init];
}

-(void)tearDown
{
	[aMite release];
}

-(void)testHaveTimer
{
	//STAssertNotNil(aMite.timer,@"");
}

/*
-(void)testBeAbleToPauseTimer
{
	
	[aMite toggleTimer];
	//STAssertNil(aMite.timer, @"Timer failed to pause");
	
	[aMite toggleTimer];
	//STAssertNotNil(aMite.timer, @"Timer failed to unpause");
	
}*/

@end
