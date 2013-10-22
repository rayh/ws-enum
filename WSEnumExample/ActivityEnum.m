//
//  ActivityEnum.m
//  WSEnumExample
//
//  Created by Ray Hilton on 29/11/11.
//  Copyright (c) 2011 Wirestorm Pty Ltd. All rights reserved.
//

#import "ActivityEnum.h"



@implementation ActivityEnum
WS_ENUM(CyclingActivityEnum, CYCLING)
WS_ENUM(RunningActivityEnum, RUNNING)
WS_ENUM(WalkingActivityEnum, WALKING)

- (CGFloat)numberOfCaloriesAfterTime:(NSTimeInterval)timeInterval
{
    return 0;
}

@end

@implementation CyclingActivityEnum
- (CGFloat)numberOfCaloriesAfterTime:(NSTimeInterval)timeInterval
{
    return timeInterval * 3.8;
}
@end

@implementation WalkingActivityEnum
- (CGFloat)numberOfCaloriesAfterTime:(NSTimeInterval)timeInterval
{
    return timeInterval * 2.76;
}
@end

@implementation RunningActivityEnum
- (CGFloat)numberOfCaloriesAfterTime:(NSTimeInterval)timeInterval
{
    return timeInterval * 4.5;
}
@end