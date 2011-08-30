//
//used to create a global accelerometer recorder
//
#import "AccController.h"

float scale = 3.0;

@implementation AccController

//x value of accelerometer
@synthesize gx;
//y value of accelerometer
@synthesize gy;

- (id)init {
    self = [super init];
    if (self) {
        //register interest in accelerometer
        UIAccelerometer *a = [UIAccelerometer sharedAccelerometer];
        //ask it to update 30 times a second
        [a setUpdateInterval:1.0/30.0];
        [a setDelegate:self];
    }
    return self;
}

//called 30 times a second. Records value of accelerometer.
- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    //record values and scale them
    gx = acceleration.x*scale;
	gy = -acceleration.y*scale;
}


@end
