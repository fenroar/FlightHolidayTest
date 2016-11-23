//
//  Hotel.m
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import "Hotel.h"

@implementation Hotel

+ (NSDictionary *)JSONKeyPathsByPropertyKey  {
    return @{ @"name" : @"name",
              @"locationName" : @"hotel_location",
              @"descriptive" : @"description",
              @"images" : @"images",
              @"rating" : @"rating",
              @"facilities" : @"facilities" };
}

@end
