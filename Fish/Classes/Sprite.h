//
//  Sprite.h
//  Fish
//
//  Created by Benjamin Squires on 6/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Fish;

@interface Sprite : UIImageView {
	float XSpeed;
	float YSpeed;
	float XPos;
	float YPos;
	int randomNum;
	int targetX;
	int targetY;
	float direction;
}

@property float XSpeed;
@property float YSpeed;

@property float XPos;
@property float YPos;
@property int randomNum;
@property float direction;



-(void) update: (Fish *)aFish;
-(void) hit;
-(void)	rebound;
-(void)	move: (Fish *)aFish;
-(void) chooseTarget;

@end