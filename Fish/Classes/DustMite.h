//
//  DustMite.h
//  Fish
//
//  Created by Daniel Loomb on 23/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DustMite : UIImageView {
	float XSpeed;
	float YSpeed;
	NSTimer *timer;
	float xdir;
	float ydir;
	int randomNum;
}

@property float XSpeed;
@property float YSpeed;

@property float XPos;
@property float YPos;
@property int randomNum;

@property (nonatomic,retain) NSTimer *timer;

-(id) init:(int)randomX : (int)randomY;
-(void) updateMite;
-(void) hit;
-(void) toggleTimer;

@end
