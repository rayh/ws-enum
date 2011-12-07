//
//  WSEnum.m
//  WSEnum
//
//  Created by Ray Hilton on 29/11/11.
//  Copyright (c) 2011 Wirestorm Pty Ltd. All rights reserved.
//

#import "WSEnum.h"
#import <objc/runtime.h>
#import <objc/message.h>

#define WS_ENUM_ASSSOC_OBJ_KEY "net.wirestorm.enum.key"

@implementation WSEnum

#pragma mark - static methods

+ (void)initialize
{
    if(self == [WSEnum class])
       return;  // Ignore the base class
       
    unsigned int count;
    
    NSLog(@"Initializing %@", NSStringFromClass(self));
    Method *methods = class_copyMethodList(object_getClass(self), &count); 
    for(int i = 0; i < count; i++) {
        SEL selector = method_getName(methods[i]);
        objc_msgSend(self, selector);
    }
    
    free(methods);
}

+ (NSArray*)enumValues
{
    NSMutableArray *enumValues = objc_getAssociatedObject(self, WS_ENUM_ASSSOC_OBJ_KEY);
 
    if(!enumValues) {
        enumValues = [NSMutableArray array];
        objc_setAssociatedObject(self, WS_ENUM_ASSSOC_OBJ_KEY, enumValues, OBJC_ASSOCIATION_RETAIN);
    }
 
//    NSLog(@"Enum values obj %@: %@", self, enumValues);
    
    return enumValues;
}

+ (id)enumWithOrdinal:(NSUInteger)ordinal
{
    return [[self enumValues] objectAtIndex:ordinal];    
}

+ (id)enumWithName:(NSString *)string
{
    for(WSEnum *e in [self enumValues]) 
    {
        if([[e name] isEqualToString:string])
            return e;
    }
    
    @throw [NSString stringWithFormat:@"No such enum value %@", string];
}

#pragma mark - instance methods

- (void)dealloc
{
    [name_ release];
    [super dealloc];
}

- (id)initWithName:(NSString *)name enumClass:(Class)cl
{
    if(self = [super init]) 
    {
        enumClass_ = cl;
        name_ = [name retain];
    }
    return self;
}

- (NSString *)name
{
    return name_;
}

- (NSUInteger)ordinal
{
    return [[enumClass_ enumValues] indexOfObject:self];
}

- (BOOL)isEqual:(id)object
{
    if(![object isKindOfClass:[self class]])
       return NO;
 
    return [[(WSEnum*)object name] isEqualToString:self.name];
}

- (NSUInteger)hash
{
    return self.name.hash;
}

@end
