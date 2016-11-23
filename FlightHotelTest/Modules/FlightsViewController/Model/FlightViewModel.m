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
        
    }
    return self;
}

@end
