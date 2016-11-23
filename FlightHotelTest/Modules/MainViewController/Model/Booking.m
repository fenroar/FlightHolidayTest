//
//  Booking.m
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import "Booking.h"

NSString * const kNoHotelSelectedMessage = @"No Hotel Selected";
NSString * const kNoFlightSelectedMessage = @"No Flight Selected";

@implementation Booking

- (void)setHotel:(Hotel *)hotel {
    _hotel = hotel;
    
    [self checkIfValid];
}

- (void)setFlight:(Flight *)flight {
    _flight = flight;
    
    [self checkIfValid];
}

- (NSAttributedString *)stringForHotelBooking {
    
    return [[NSAttributedString alloc] initWithString:NSLocalizedString(kNoHotelSelectedMessage, @"Ho Hotel Selected")];
}

- (NSAttributedString *)stringForFlightBooking {
    
    return [[NSAttributedString alloc] initWithString:NSLocalizedString(kNoFlightSelectedMessage, @"Ho Hotel Selected")];
}

#pragma mark - Private

- (void)checkIfValid {
    
    BOOL bookingIsValid = self.hotel && self.flight;
    
    if ([self.delegate respondsToSelector:@selector(bookingModifiedIsValid:)]) {
        [self.delegate bookingModifiedIsValid:bookingIsValid];
    }
}


@end
