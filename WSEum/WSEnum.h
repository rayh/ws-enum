//
//  WSEnum.h
//  WSEnum
//
//  Created by Ray Hilton on 29/11/11.
//  Copyright (c) 2011 Wirestorm Pty Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

#define WS_ENUM(_CLASSNAME_,_TYPE_) \
+ (_CLASSNAME_*)_TYPE_ { \
    static dispatch_once_t once; \
    static _CLASSNAME_ *thisEnum; \
    dispatch_once(&once, ^ { \
        thisEnum = [[_CLASSNAME_ alloc] initWithName:@""#_TYPE_ enumClass:self]; \
        NSLog(@"Adding enum %@ to %@", thisEnum, NSStringFromClass(self)); \
        [(NSMutableArray*)[self enumValues] addObject:thisEnum]; \
    }); \
    return thisEnum; \
}

@interface WSEnum : NSObject {
    NSString *name_;
    Class enumClass_;
}
@property (nonatomic, readonly) NSString *name; 
@property (nonatomic, readonly) NSUInteger ordinal;
- (id)initWithName:(NSString*)name enumClass:(Class)cl;
+ (id)enumWithName:(NSString*)string;
+ (id)enumWithOrdinal:(NSUInteger)ordinal;
+ (NSArray*)enumValues;
@end
