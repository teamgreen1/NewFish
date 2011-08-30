//
//  FishAppDelegate.h
//  Fish
//
//  Created by Daniel Loomb on 22/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FishViewController;

@interface FishAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    FishViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet FishViewController *viewController;

@end

