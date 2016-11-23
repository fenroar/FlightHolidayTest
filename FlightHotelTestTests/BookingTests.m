//
//  BookingTests.m
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Booking.h"
#import "Flight.h"
#import "Hotel.h"

@interface BookingTests : XCTestCase <BookingDelegate>

@property (nonatomic) BOOL validBooking;

@end

@implementation BookingTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.validBooking = false;
}

- (void)testValidBooking {
    
    Booking *booking = [Booking new];
    booking.delegate = self;
    
    Flight *flight = [Flight new];
    Flight *flight2 = [Flight new];
    Hotel *hotel = [Hotel new];
    
    booking.flight = flight;
    XCTAssertFalse(self.validBooking);
    
    booking.hotel = hotel;
    XCTAssertTrue(self.validBooking);
    
    booking.hotel = nil;
    XCTAssertFalse(self.validBooking);
    
    booking.hotel = hotel;
    XCTAssertTrue(self.validBooking);
    
    booking.flight = flight2;
    XCTAssertTrue(self.validBooking);
}

- (void)testDisplayString {
    
    Booking *booking = [Booking new];
    
    // No bookings for flights
    XCTAssertEqualObjects([booking stringForFlightBooking].string, kNoFlightSelectedMessage);
    booking.flight = [Flight new];
    // Flight set, shouldn't display the no flight message
    XCTAssertNotEqualObjects([booking stringForFlightBooking].string, kNoFlightSelectedMessage);
    
    // No bookings for hotels
    XCTAssertEqualObjects([booking stringForHotelBooking].string, kNoHotelSelectedMessage);
    booking.hotel = [Hotel new];
    // Hotel set, shouldn't display the no hotel message
    XCTAssertNotEqualObjects([booking stringForHotelBooking].string, kNoHotelSelectedMessage);
}

- (void)bookingModifiedIsValid:(BOOL)valid {
    _validBooking = valid;
}

@end
