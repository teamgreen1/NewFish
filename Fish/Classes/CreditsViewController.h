//
//  CreditsViewController.h
//  Fish
//
//  Created by Daniel Loomb on 29/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CreditsViewController : UIViewController {
		IBOutlet UIScrollView *scrollView;
}

@property (nonatomic, retain)IBOutlet UIScrollView *scrollView;

-(IBAction)back;

-(void)addImageAsSubView:(NSString *)image :(int )location :(UIScrollView *)scroller;


@end
