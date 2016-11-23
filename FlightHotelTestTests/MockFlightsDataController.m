//
//  MockFlightsDataController.m
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import "MockFlightsDataController.h"
#import "Flight.h"

@interface FlightsDataController ()

@property (nonatomic, strong, readwrite) NSArray *flights;

@end

@implementation MockFlightsDataController

- (void)fetchData:(void (^)(id _Nullable, NSError * _Nullable))completionBlock {
    
    Flight *mockFlight = [Flight new];
    
    self.flights = @[mockFlight];
    
    if (completionBlock) { completionBlock(nil, nil); }
}

@end
