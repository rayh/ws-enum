//
//  ViewController.h
//  WSEnumExample
//
//  Created by Ray Hilton on 29/11/11.
//  Copyright (c) 2011 Wirestorm Pty Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic, retain) IBOutlet UILabel *outputLabel;
@property (nonatomic, retain) IBOutlet UILabel *timeTakenLabel;
@property (nonatomic, retain) IBOutlet UILabel *transportLabel;
@property (nonatomic, retain) IBOutlet UISegmentedControl *segmentedControl;
- (IBAction)transportModeChanged:(id)sender;
@end
