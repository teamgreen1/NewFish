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
}

@property float XSpeed;
@property float YSpeed;

@property float XPos;
@property float YPos;

@property (nonatomic,retain) NSTimer *timer;

-(void) updateMite;
-(void) hit;
-(void) toggleTimer;

@end
