//
//  Flight.h
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Flight : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly, nullable) NSString *airline;
@property (nonatomic, strong, readonly, nullable) NSDate *departureDate;
@property (nonatomic, strong, readonly, nullable) NSDate *arrivalDate;
@property (nonatomic, strong, readonly, nullable) NSDecimalNumber *price;
@property (nonatomic, copy, readonly, nullable) NSString *departureAirport;
@property (nonatomic, copy, readonly, nullable) NSString *arrivalAirport;

@end
