//
//  Booking.m
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import "Booking.h"
#import "Hotel.h"
#import "Flight.h"
#import "FlightViewModel.h"

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
    
    if (self.hotel) {
        
        NSString *displayString = self.hotel.name ? self.hotel.name : @"";
        return [[NSAttributedString alloc] initWithString:displayString
                                               attributes:[self validAttributeDictionary]];
    } else {
        return [[NSAttributedString alloc] initWithString:NSLocalizedString(kNoHotelSelectedMessage, @"No Hotel Selected")
                attributes:[self invalidAttributeDictionary]];
    }
}

- (NSAttributedString *)stringForFlightBooking {
    
    if (self.flight) {
        
        FlightViewModel *viewModel = [[FlightViewModel alloc] initWithFlight:self.flight];
        
        NSMutableString *displayString = @"".mutableCopy;
        
        [displayString appendString:[NSString stringWithFormat:@"%@\n", viewModel.sourceDestination]];
        
        [displayString appendString:[NSString stringWithFormat:@"%@\n", viewModel.depatureDate]];
        
        [displayString appendString:[NSString stringWithFormat:@"%@\n", viewModel.time]];
        
        [displayString appendString:[NSString stringWithFormat:@"%@\n", viewModel.price]];
        
        return [[NSAttributedString alloc] initWithString:displayString
                                               attributes:[self validAttributeDictionary]];
    } else {
        return [[NSAttributedString alloc] initWithString:NSLocalizedString(kNoFlightSelectedMessage, @"No Flight Selected")
                                               attributes:[self invalidAttributeDictionary]];
    }
}

- (BOOL)bookingIsValid {
    
    return self.hotel && self.flight;
}

#pragma mark - Private

- (void)checkIfValid {
    
    if ([self.delegate respondsToSelector:@selector(bookingModified:isValid:)]) {
        [self.delegate bookingModified:self isValid:[self bookingIsValid]];
    }
}

#pragma mark - Helpers

- (NSDictionary *)validAttributeDictionary {
    return @{ NSForegroundColorAttributeName : [UIColor blackColor]};
}

- (NSDictionary *)invalidAttributeDictionary {
    return @{ NSForegroundColorAttributeName : [UIColor lightGrayColor]};
}

@end
