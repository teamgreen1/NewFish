
#import "Fish.h"
#import "AccController.h"

AccController *acc;

float width = 768;
float height = 1024;
float ball_radius = 50;
float friction = .6;



@implementation Fish;
@synthesize XSpeed;
@synthesize YSpeed;

@synthesize XPos;
@synthesize YPos;

@synthesize timer;

- (id)init {
    self = [super initWithImage:[UIImage imageNamed:@"fish.png"]];
    if (self) {
        if(!acc)
        {
            acc = [[AccController alloc] init];
        }
		XPos = width/2;
		YPos = height/2;
        [self setFrame:CGRectMake(0, 0, ball_radius*2, ball_radius*2)];
        
        [self toggleTimer];
    }
    return self;
}

-(void) updateFish
{
	
	XSpeed += acc.gx;
 	YSpeed += acc.gy;
	

	float newX = XPos + XSpeed;
	float newY = YPos + YSpeed;
	
	/*
	 *Check the fish is with in horizonal bounds of the screen
	 */
	
	if(newX > (width - ball_radius)){//if the fish is beyond the width
		
		//XPos = width - ball_radius;
		XSpeed = -XSpeed;
		XSpeed *= friction;
		//XSpeed += acc.gx;
		
	}			
	if (newX < ball_radius) {
		XPos = ball_radius;
		XSpeed = - XSpeed;
		XSpeed *= friction;
		XSpeed += acc.gx;
	}
		XPos = XPos + XSpeed;		
	
	
	
	/*
	 *Check the fish is with in the vertical bounds of the screen
	 */
	
	if(newY > (height - ball_radius)){//if the fish is off the bottom of the screen
		YPos = height - ball_radius;
		YSpeed = -YSpeed;
		YSpeed *= friction;
		YSpeed += acc.gy;
		
	}
	if(newY < ball_radius){
		YPos = ball_radius;
		YSpeed = -YSpeed;
		YSpeed *= friction;
		YSpeed += acc.gy;
	}
			
		YPos = YPos + YSpeed;
	
	//The The Fish on the Ipad
	[self setCenter:CGPointMake(XPos, YPos)];
	
	XSpeed *= .99;
	YSpeed *= .99;
}





-(void) hit
{
	YSpeed = -YSpeed;
	YSpeed *= friction;
	
	XSpeed = -XSpeed;
	XSpeed *= friction;
	
	XPos += XSpeed;
	YPos += YSpeed;
	
	[self setCenter:CGPointMake(XPos, YPos)];
}


/*
 * A method to pause the timer
 */
-(void) toggleTimer{
	if (self.timer == nil) {//if the timer is empty, create it
		self.timer = [NSTimer scheduledTimerWithTimeInterval:1/30.0 target:self selector:@selector(updateFish) userInfo:nil repeats:true];
	}
	else{//if the timer is going stop it
		[self.timer invalidate];
		self.timer = nil;
	}
}


@end