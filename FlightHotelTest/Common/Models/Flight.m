//
//  Flight.m
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import "Flight.h"
#import "MTLModel+Transform.h"

@implementation Flight

+ (NSDictionary *)JSONKeyPathsByPropertyKey  {
    return @{ @"airline" : @"airline",
              @"departureDate" : @"departure_date",
              @"arrivalDate" : @"arrival_date",
              @"price" : @"price",
              @"departureAirport" : @"departure_airport",
              @"arrivalAirport" : @"arrival_airport"
              };
}

+ (NSValueTransformer *)priceJSONTransformer {
    return [self priceTransformer];
}

+ (NSValueTransformer *)departureDateJSONTransformer {
    return [self iso8601ToDateTransformer];
}

+ (NSValueTransformer *)arrivalDateJSONTransformer {
    return [self iso8601ToDateTransformer];
}

@end
