//
//  AnimalFur.h
//  Fish
//
//  Created by Daniel Loomb on 23/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Sprite.h"

@interface AnimalFur : Sprite
{
	
}

-(id) init:(int)randomX :(int)randomY;

-(void) chooseTarget;
-(void)spitProjectile;


@end
