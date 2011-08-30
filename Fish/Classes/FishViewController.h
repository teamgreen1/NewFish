//
//  FishViewController.h
//  Fish
//
//  Created by Daniel Loomb on 22/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FishViewController : UIViewController {
	IBOutlet UIButton *startButton;
	IBOutlet UIButton *asthmapediaButton;
	IBOutlet UIButton *optionsButton;
	IBOutlet UILabel *asthmaWaikatoLabel;
}

-(IBAction)menuItemLevelSelect;
-(IBAction)menuItemAsthmapedia;
-(IBAction)menuItemOptions;
-(IBAction)menuItemVisitAsthmaWaikato;



@end

