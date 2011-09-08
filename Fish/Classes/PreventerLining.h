//
//  untitled.h
//  Fish
//
//  Created by Billy-Jo Hunia on 3/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PreventerLining : UIImageView {
	
	float XPos;
	float YPos;
	int Health;
	bool HasBeenHit;
	
}

@property float XPos;
@property float YPos;
@property int Health;
@property bool HasBeenHit;

-(void)hit;
-(void)isDamage;

@end