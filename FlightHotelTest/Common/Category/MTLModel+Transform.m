//
//  MTLModel+Transform.m
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import "MTLModel+Transform.h"

static const double kPenceInAPound = 100;

@implementation MTLModel (Transform)

+ (MTLValueTransformer *)priceTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        
        if ([value isKindOfClass:NSNumber.class]) {
            NSNumber *priceInPence = (NSNumber *)value;
            NSString *stringRepresentationOfDouble = [[NSString alloc] initWithFormat:@"%f", priceInPence.doubleValue / kPenceInAPound];
            return [NSDecimalNumber decimalNumberWithString:stringRepresentationOfDouble];
        } else {
            return [NSDecimalNumber minimumDecimalNumber];
        }
        
    } reverseBlock:^id(NSDecimalNumber *priceInPounds, BOOL *success, NSError *__autoreleasing *error) {
        
        NSDecimalNumber *poundsToPenceConversion = [[NSDecimalNumber alloc] initWithDouble:kPenceInAPound];
        
        return (NSNumber *)[priceInPounds decimalNumberByDividingBy:poundsToPenceConversion];
    }];
}

+ (MTLValueTransformer *)iso8601ToDateTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id date, BOOL *success, NSError *__autoreleasing *error) {
        
        if ([date isKindOfClass:[NSString class]]) {
            NSDate *UTCDate = [[self sharedDateFormatter] dateFromString:date];
            
            return UTCDate;
        }
        
        return [NSDate date];
        
    } reverseBlock:^id(NSDate *date, BOOL *success, NSError *__autoreleasing *error) {
        
        return [[self sharedDateFormatter] stringFromDate:date];
    }];
}

#pragma mark - Date Formatters

+ (NSDateFormatter *)sharedDateFormatter
{
    static NSDateFormatter *sharedDateFormatter = nil ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDateFormatter = [NSDateFormatter new] ;
        sharedDateFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
        sharedDateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    });
    
    return sharedDateFormatter ;
}

@end
