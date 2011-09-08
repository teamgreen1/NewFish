//
//  PreventerArray.m
//  Fish
//
//  Created by Billy-Jo Hunia on 3/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PreventerArray.h"
#import "PreventerLining.h"
#import "DustMite.h"


@implementation PreventerArray


//PerventerLining *currentLining;
float currentX;
float currentY;

-(void)createArray: (float) xStart: (float) yStart
{		
	arrayLining = [[NSMutableArray alloc] init];
	
	currentX = xStart;
	currentY = yStart;
	
	[self createArrayLoop:20 :0 :50 :true :true];
	
	currentX = 743;
	currentY = yStart;
	
	[self createArrayLoop:20 :0 :50 :true :true];
	
	
}

-(NSMutableArray *)getArray{
	return arrayLining;
}


-(void)checkCollisionWithTrigger: (DustMite *) mite{
	
	for(PreventerLining *pLining in arrayLining) {
		
		if(CGRectIntersectsRect(pLining.frame, mite.frame)){
			
			//bool otherBeenHit = false;
			
			//for(PreventerLining *otherLining in arrayLining){
				
				//if(otherLining.HasBeenHit == true){
					//otherBeenHit = true;
					//break;
				//}
			//}
			
			//if(otherBeenHit == false){
				[pLining hit];
				[mite rebound];
			//}
			
		}
	}
}

-(void)checkHealthOfLinings{
	
	int count = [arrayLining count];
	int index = count - 1;
	PreventerLining *currentLining;
	
	for(int i = count; i > 0; i--) {
		
		currentLining = [arrayLining objectAtIndex: index];
		
		if(currentLining.Health == 0){
			
			printf("Lining is Destory\n");
			[currentLining removeFromSuperview];
			[arrayLining removeObjectAtIndex: index];
		}
		else if(currentLining.Health == 1){
			
			[currentLining isDamage];
		}
		
		index = index - 1;
	}
	
}

-(void) createArrayLoop: (int) loop: (int) xIncrease: (int) yIncrease: (bool) xIsPos: (bool) yIsPos{
	
	PreventerLining *currentLining;
	
	for(int i=0;i<loop;i++){
		currentLining = [[PreventerLining alloc] init];
		
		CGPoint pPoint = CGPointMake(currentX, currentY);
		[currentLining setCenter:(pPoint)];
		[arrayLining addObject:currentLining];
		
		if(xIsPos == true){
			currentX = currentX + xIncrease;}
		else{
			currentX = currentX - xIncrease;}
		
		if(yIsPos == true){
			currentY = currentY + yIncrease;}
		else{
			currentY = currentY - yIncrease;}	
		
		[currentLining release];
	}
}

@end
