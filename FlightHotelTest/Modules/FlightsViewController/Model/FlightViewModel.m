//
//  FlightViewModel.m
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import "FlightViewModel.h"
#import "Flight.h"

@interface FlightViewModel ()

@property (nonatomic, copy, readwrite, nonnull) NSString *sourceDestination;
@property (nonatomic, copy, readwrite, nonnull) NSString *depatureDate;
@property (nonatomic, copy, readwrite, nonnull) NSString *time;
@property (nonatomic, copy, readwrite, nonnull) NSString *airline;
@property (nonatomic, copy, readwrite, nonnull) NSString *price;

@end

@implementation FlightViewModel

- (instancetype)initWithFlight:(Flight *)flight {

    if (self = [super init]) {
        
        NSString *source = flight.departureAirport ? flight.departureAirport : @"N/A";
        NSString *destination = flight.arrivalAirport ? flight.arrivalAirport : @"N/A";
        self.sourceDestination = [NSString stringWithFormat:@"%@ -> %@", source, destination];
        
        NSString *dateString = [[FlightViewModel sharedDateFormatter] stringFromDate:flight.departureDate];
        self.depatureDate = dateString ? dateString : @"N/A";
        
        NSString *timeString = [[FlightViewModel sharedTimeIntervalFormatter] stringFromDate:flight.departureDate toDate:flight.arrivalDate];
        self.time = timeString ? timeString : @"N/A";
        
        self.airline = flight.airline ? flight.airline : @"N/A";
        
        NSString *priceString = [[FlightViewModel sharedPriceFormatter] stringFromNumber:flight.price];
        self.price = priceString ? priceString : @"N/A";
        
    }
    return self;
}

+ (NSDateFormatter *)sharedDateFormatter {
    static NSDateFormatter *sharedDateFormatter = nil ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDateFormatter = [NSDateFormatter new] ;
        sharedDateFormatter.dateStyle = NSDateFormatterMediumStyle;
        sharedDateFormatter.timeStyle = NSDateFormatterNoStyle;
    });
    
    return sharedDateFormatter ;
}

+ (NSDateIntervalFormatter *)sharedTimeIntervalFormatter {
    static NSDateIntervalFormatter *sharedTimeIntervalFormatter = nil ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedTimeIntervalFormatter = [NSDateIntervalFormatter new] ;
        sharedTimeIntervalFormatter.dateStyle = NSDateIntervalFormatterNoStyle;
        sharedTimeIntervalFormatter.timeStyle = NSDateIntervalFormatterShortStyle;
    });
    
    return sharedTimeIntervalFormatter;
}


+ (NSNumberFormatter *)sharedPriceFormatter {
    static NSNumberFormatter *sharedPriceFormatter = nil ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedPriceFormatter = [NSNumberFormatter new];
        sharedPriceFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_GB"];
        sharedPriceFormatter.numberStyle = NSNumberFormatterCurrencyStyle;
    });
    
    return sharedPriceFormatter ;
}

@end
