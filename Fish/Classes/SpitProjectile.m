//
//  SpitProjectile.m
//  Fish
//
//  Created by Daniel Loomb on 8/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SpitProjectile.h"


@implementation SpitProjectile

- (id)init :(int)randomX : (int)randomY {
    self = [super initWithImage:[UIImage imageNamed:@"preventerBubbleGreen.png"]];
    if(self){
		
		XPos = randomX;
		YPos = randomY;
        [self setFrame:CGRectMake(XPos, YPos, 25, 25)];
		
		[NSTimer scheduledTimerWithTimeInterval:1/30.0 target:self selector:@selector(move) userInfo:nil repeats:true];
		self.chooseTarget;
		
		
    }
    return self;
}

//### Overides superclass
-(void) move{
	XPos += 5;
	
	if(XPos > 1500){
		[self removeFromSuperview];		
		[self release];
		printf("You Crashed Because spit isn't removing itself Properly. Sorry");
	}
	[self setCenter:CGPointMake(XPos, YPos)];
}

@end
