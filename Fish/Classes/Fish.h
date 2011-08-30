
#import <UIKit/UIKit.h>


@interface Fish : UIImageView {
    float XSpeed;
    float YSpeed;
	float XPos;
	float YPos;
	NSTimer *timer;
}

@property float XSpeed;
@property float YSpeed;

@property float XPos;
@property float YPos;

@property (nonatomic,retain) NSTimer *timer;

-(void) updateFish;
-(void) hit;
-(void) toggleTimer;


@end
