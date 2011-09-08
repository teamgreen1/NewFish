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
	//NSTimer *timer;
	float xdir;
	float ydir;
	int randomNum;
}

@property float XSpeed;
@property float YSpeed;

@property float XPos;
@property float YPos;
@property int randomNum;

//@property (nonatomic,retain) NSTimer *timer;

-(void) update: (Fish *)aFish;
-(void) hit;
-(void)rebound;
//-(void) toggleTimer;

@end