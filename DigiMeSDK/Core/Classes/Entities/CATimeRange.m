//
//  CATimeRange.m
//  DigiMeSDK
//
//  Created on 27/11/2018.
//  Copyright © 2018 digi.me Limited. All rights reserved.
//

#import "CATimeRange.h"

@interface CATimeRange()

@property (nonatomic, strong, nullable, readwrite) NSDate *from;
@property (nonatomic, strong, nullable, readwrite) NSDate *to;
@property (nonatomic, strong, nullable, readwrite) NSString *last;

@end

@implementation CATimeRange

+ (CATimeRange *)from:(NSDate *)from
{
    CATimeRange *range = [CATimeRange new];
    range.from = from;
    
    return range;
}

+ (CATimeRange *)from:(NSDate *)from to:(NSDate *)to
{
    if ([to timeIntervalSinceDate:from] <= 0)
    {
        [NSException raise:NSInternalInconsistencyException format:@"`from` date must be *before* `to` date."];
    }
    
    CATimeRange *range = [CATimeRange new];
    range.from = from;
    range.to = to;
    
    return range;
}

+ (CATimeRange *)priorTo:(NSDate *)priorTo
{
    CATimeRange *range = [CATimeRange new];
    range.to = priorTo;
    
    return range;
}

+ (CATimeRange *)last:(NSUInteger)x unit:(CATimeRangeUnit)unit
{
    CATimeRange *range = [CATimeRange new];
    NSString *unitString = [[self class] stringFromUnit:unit];
    range.last = [NSString stringWithFormat:@"%@%@", @(x), unitString];
    
    return range;
}

+ (NSString *)stringFromUnit:(CATimeRangeUnit)unit
{
    switch (unit) {
        case CATimeRangeUnitDay:
            return @"d";
            
        case CATimeRangeUnitMonth:
            return @"m";
            
        case CATimeRangeUnitYear:
            return @"y";
    }
}

@end