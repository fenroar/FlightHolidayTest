//
//  ModelTests.m
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Hotel.h"
#import "Flight.h"

@interface ModelTests : XCTestCase

@end

@implementation ModelTests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testHotelMapping {
    
    NSDictionary *responseDictionary = @{ @"name" : @"Labranda Isla Bonita Hotel",
                                          @"hotel_location" : @"Costa Adeje, Tenerife, Canaries",
                                          @"description" : @"On the Beach Offer - Save up to 15%\r\nBook this hotel by 31.10.2016, for travel between 01.11.2016 and 30.04.2017. Offer applicable to all room types on any board basis.",
                                          @"images" : @[ @"https://i.onthebeach.co.uk/v1/hotel_images/1ba1aa1c-17e4-4717-afe7-f2b2ea877b87/cover/374/296/high/1.0/labranda-isla-bonita-hotel.jpeg",
                                                         @"https://i.onthebeach.co.uk/v1/hotel_images/73f82009-b0f5-43b6-9eee-cb0fb25f459a/cover/374/296/high/1.0/labranda-isla-bonita-hotel.jpeg",
                                                         @"https://i.onthebeach.co.uk/v1/hotel_images/d26659fb-e513-4fbf-9fed-2c24583ad4f0/cover/374/296/high/1.0/labranda-isla-bonita-hotel.jpeg"],
                                          @"rating" : @4,
                                          @"facilities" : @[ @"24 Hour Reception",
                                                             @"Aerobics",
                                                             @"Air Conditioning"]
                                          };
    NSError *parseError = nil;
    
    Hotel *hotel = [MTLJSONAdapter modelOfClass:[Hotel class]
                             fromJSONDictionary:responseDictionary
                                          error:&parseError];
    XCTAssertNotNil(hotel.name);
    XCTAssertNotNil(hotel.locationName);
    XCTAssertNotNil(hotel.descriptive);
    XCTAssertNotNil(hotel.images);
    XCTAssertNotNil(hotel.facilities);
    
    XCTAssertNil(parseError);
}

- (void)testFlightMapping {
    
    NSDictionary *responseDictionary = @{ @"airline" : @"FastJet",
                                          @"departure_date" : @"2016-10-20T10:00:00Z",
                                          @"arrival_date": @"2016-10-20T11:00:00Z",
                                          @"price": @12300,
                                          @"departure_airport": @"London Gatwick",
                                          @"arrival_airport": @"Barcelona"
                                          };
    
    NSError *parseError = nil;
    
    Flight *flight = [MTLJSONAdapter modelOfClass:[Flight class]
                             fromJSONDictionary:responseDictionary
                                          error:&parseError];
    
    XCTAssertNotNil(flight.airline);
    XCTAssertNotNil(flight.departureDate);
    XCTAssertNotNil(flight.arrivalDate);
    XCTAssertNotNil(flight.price);
    XCTAssertNotNil(flight.departureAirport);
    XCTAssertNotNil(flight.arrivalAirport);
    
    XCTAssertNil(parseError);
    
}

@end
