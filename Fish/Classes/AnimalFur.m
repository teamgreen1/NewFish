//
//  DustMite.m
//  Fish
//
//  Created by Daniel Loomb on 23/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AnimalFur.h"
#import "SpitProjectile.h"

@implementation AnimalFur




float animalFur_radius = 30;


- (id)init :(int)randomX : (int)randomY {
    self = [super initWithImage:[UIImage imageNamed:@"animalFur.png"]];
    if(self){
		
		XPos = randomX;
		YPos = randomY;
        [self setFrame:CGRectMake(XPos, YPos, animalFur_radius*2.2, animalFur_radius*2)];
		
		
		self.chooseTarget;
		
		
    }
    return self;
}




/* ####Overides Superclass Method
 * 
 */
-(void)chooseTarget{
	[self spitProjectile];
	
	targetX = arc4random() % 530 + 150;
	targetY = arc4random() % 804 + 150;
}

-(void)spitProjectile{
	//SpitProjectile *theSpit = [[SpitProjectile alloc] init:XPos:YPos];
	//[self.superview addSubview:theSpit];
	
}

@end