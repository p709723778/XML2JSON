//
//  LVMainViewController.h
//  XML2JSON
//
//  Created by lvyile on 8/23/12.
//  Copyright (c) 2012 lvyile. All rights reserved.
//

#import "LVFlipsideViewController.h"

@interface LVMainViewController : UIViewController <LVFlipsideViewControllerDelegate, UIPopoverControllerDelegate>

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

@end
