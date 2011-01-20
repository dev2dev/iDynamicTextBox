//
//  iDynamicTextBoxExampleAppDelegate.h
//  iDynamicTextBoxExample
//
//  Created by tim on 20/01/11.
//  Copyright 2011 Ink Scribbles. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iDynamicTextBoxExampleViewController;

@interface iDynamicTextBoxExampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    iDynamicTextBoxExampleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet iDynamicTextBoxExampleViewController *viewController;

@end

