//
//  Booking.h
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Flight;
@class Hotel;

@protocol BookingDelegate;

@interface Booking : NSObject

@property (nonatomic, strong, nullable) Flight *flight;
@property (nonatomic, strong, nullable) Hotel *hotel;

@property (nonatomic, weak, nullable) id<BookingDelegate> delegate;


@end

@protocol BookingDelegate <NSObject>

- (void)bookingModifiedIsValid:(BOOL)valid;

@end
