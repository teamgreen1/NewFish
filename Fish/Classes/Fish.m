
#import "Fish.h"
#import "AccController.h"

AccController *acc;

float width = 768;
float height = 1002;
float ball_radius = 50;
float friction = .9;
float maxSpeed = 10;
float minSpeed = -10;



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
        [self setFrame:CGRectMake(0, 0, ball_radius*2, ball_radius*2)];
        
        [self toggleTimer];
    }
    return self;
}

-(void) updateFish
{
	/*
	 *Check the fish is with in horizonal bounds of the screen
	 */
	
	if(XPos > width ){//if the fish is beyond the width
		
		//set its speed in the oposite direction
		[self setXSpeed:(self.XSpeed - (1.8*self.XSpeed))];		
		XPos = (self.center.x -5) + self.XSpeed;//move the position 5 pixels of the wall ( to stop jumping out of the bounds)
		
	}		
	else if(XPos < 0){//if the fish is beneth the width
		
		//set its speed in the opposite direction
		[self setXSpeed:(self.XSpeed - (1.8*self.XSpeed))];		
		XPos = (self.center.x +5) + self.XSpeed;//move the position 5 pixels off the wall (to stop jumpng out of bounds)		
		
	}
	else {//its with in the width update its speed
	
		
		XPos = self.center.x + self.XSpeed;
		
		
		
	}

	
	
	/*
	 *Check the fish is with in the vertical bounds of the screen
	 */
	
	if(YPos > height ){//if the fish is off the bottom of the screen
		
		//set its speed in the oposite direction
		[self setYSpeed:(self.YSpeed - (1.8*self.YSpeed))];		
		YPos = (self.center.y -5) + self.YSpeed;//move the position 5 pixels of the wall ( to stop jumping out of the bounds)
		
	}
	else if(YPos < 0){//if the fish is off the top of the screen
		
		//set its speed in the oposite direction
		[self setYSpeed:(self.YSpeed - (1.8*self.YSpeed))];		
		YPos = (self.center.y +5) + self.YSpeed;//move the position 5 pixels of the wall ( to stop jumping out of the bounds)
		
	}
	else {//its within the height, update its speed
		
		
		YPos = self.center.y + self.YSpeed;
		
	}	
	
		
	/*
	 *Checks that the speeds aren't getting ridiculus
	 */
	if (self.XSpeed < maxSpeed && self.XSpeed > minSpeed) {		
		[self setXSpeed:self.XSpeed + acc.gx]; 	
	}
	if (self.YSpeed < maxSpeed && self.YSpeed > minSpeed) {
		[self setYSpeed:self.YSpeed  + acc.gy];	
	}
	
	
	
	//The The Fish on the Ipad
	[self setCenter:CGPointMake(XPos, YPos)];
}





-(void) hit
{
	[self setYSpeed:(self.YSpeed - (2*self.YSpeed))];
	[self setXSpeed:(self.XSpeed - (2*self.XSpeed))];
	
	XPos = self.center.x + self.XSpeed;
	YPos = self.center.y + self.YSpeed;
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