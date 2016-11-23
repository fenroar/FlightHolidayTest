//
//  FlightViewModel.h
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Flight;

@interface FlightViewModel : NSObject

@property (nonatomic, copy, readonly, nonnull) NSString *sourceDestination;
@property (nonatomic, copy, readonly, nonnull) NSString *depatureDate;
@property (nonatomic, copy, readonly, nonnull) NSString *time;
@property (nonatomic, copy, readonly, nonnull) NSString *airline;
@property (nonatomic, copy, readonly, nonnull) NSString *price;

- (nonnull instancetype)initWithFlight:(nonnull Flight *)flight;

@end
