//
//  LVFlipsideViewController.h
//  XML2JSON
//
//  Created by lvyile on 8/23/12.
//  Copyright (c) 2012 lvyile. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LVFlipsideViewController;

@protocol LVFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(LVFlipsideViewController *)controller;
@end

@interface LVFlipsideViewController : UIViewController

@property (retain, nonatomic) id <LVFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
