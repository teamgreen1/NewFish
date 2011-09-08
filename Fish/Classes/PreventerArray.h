//
//  PreventerArray.h
//  Fish
//
//  Created by Billy-Jo Hunia on 3/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PreventerLining.h"

@class DustMite;


@interface PreventerArray : NSObject {
	NSMutableArray *arrayLining;
}

-(void)createArray:(float)xStart :(float)yStart;
-(void)checkCollisionWithTrigger: (DustMite *) mite;
-(void)checkHealthOfLinings;
-(void) createArrayLoop: (int) loop: (int) xIncrease: (int) yIncrease: (bool) xIsPos: (bool) yIsPos;
-(NSMutableArray *)getArray;

@end
