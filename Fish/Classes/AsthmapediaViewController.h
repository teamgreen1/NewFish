//
//  AsthmapediaViewController.h
//  Fish
//
//  Created by Daniel Loomb on 22/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AsthmapediaViewController : UIViewController {
	IBOutlet UIScrollView *scrollView;
}

@property (nonatomic, retain)IBOutlet UIScrollView *scrollView;

-(IBAction)back;
-(void)addImageAsSubView:(NSString *)image :(int )location :(UIScrollView *)scroller;

@end
