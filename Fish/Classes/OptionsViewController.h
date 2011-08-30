//
//  OptionsViewController.h
//  Fish
//
//  Created by Daniel Loomb on 29/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface OptionsViewController : UIViewController {
	UIAlertView *alertWithOkButton;
	IBOutlet UIButton *resetButton;
	IBOutlet UIButton *soundsButton;
	IBOutlet UIButton *musicButton;
	IBOutlet UIButton *creditsButton;
}

-(IBAction)back;
-(IBAction)reset;
-(IBAction)sounds;
-(IBAction)music;
-(IBAction)credits;

@end
