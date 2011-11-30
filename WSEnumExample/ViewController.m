//
//  ViewController.m
//  WSEnumExample
//
//  Created by Ray Hilton on 29/11/11.
//  Copyright (c) 2011 Wirestorm Pty Ltd. All rights reserved.
//

#import "ViewController.h"
#import "ActivityEnum.h"

@interface ViewController ()
@property (nonatomic, assign) ActivityEnum *activty;
@property (nonatomic, assign) NSInteger timeTaken;
- (void)tick;
@end

@implementation ViewController
@synthesize activty=activty_;
@synthesize outputLabel=outputLabel_;
@synthesize transportLabel=transportLabel_;
@synthesize segmentedControl=segmentedControl_;
@synthesize timeTakenLabel=timeTakenLabel_;
@synthesize timeTaken=timeTaken_;


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.activty = [ActivityEnum enumWithOrdinal:0];
    self.transportLabel.text = self.activty.name;
    self.timeTaken = 150;
    
    for(ActivityEnum *value in [ActivityEnum enumValues]) {
        NSLog(@"Got enum value %@ with name %@ and ordinal %d", value, value.name, value.ordinal);
        [self.segmentedControl setTitle:value.name forSegmentAtIndex:value.ordinal];
    }
    
//    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    [self tick];
}

- (void)tick
{
    self.timeTakenLabel.text = [NSString stringWithFormat:@"%ds", self.timeTaken];
    self.outputLabel.text = [NSString stringWithFormat:@"%0.3f",[self.activty numberOfCaloriesAfterTime:self.timeTaken]];
//    self.timeTaken++;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)transportModeChanged:(UISegmentedControl*)sender
{
    self.activty = [ActivityEnum enumWithOrdinal:sender.selectedSegmentIndex];
    self.transportLabel.text = self.activty.name;
//    self.timeTaken = 0;
    [self tick];
}

@end
