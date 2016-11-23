//
//  Booking.m
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import "Booking.h"

@implementation Booking

- (void)setHotel:(Hotel *)hotel {
    _hotel = hotel;
    
    if ([self.delegate respondsToSelector:@selector(bookingModifiedIsValid:)]) {
        [self.delegate bookingModifiedIsValid:false];
    }
}

- (void)setFlight:(Flight *)flight {
    _flight = flight;
    
    if ([self.delegate respondsToSelector:@selector(bookingModifiedIsValid:)]) {
        [self.delegate bookingModifiedIsValid:false];
    }
}


@end
