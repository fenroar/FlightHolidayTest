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

extern NSString * const __nonnull kNoHotelSelectedMessage;
extern NSString * const __nonnull kNoFlightSelectedMessage;

@protocol BookingDelegate;

@interface Booking : NSObject

@property (nonatomic, strong, nullable) Flight *flight;
@property (nonatomic, strong, nullable) Hotel *hotel;

@property (nonatomic, weak, nullable) id<BookingDelegate> delegate;

- (nonnull NSAttributedString *)stringForHotelBooking;
- (nonnull NSAttributedString *)stringForFlightBooking;

@end

@protocol BookingDelegate <NSObject>

- (void)bookingModifiedIsValid:(BOOL)valid;

@end
