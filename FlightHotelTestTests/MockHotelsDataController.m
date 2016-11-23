//
//  MockHotelsDataController.m
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import "MockHotelsDataController.h"
#import "Hotel.h"

@interface HotelsDataController ()

@property (nonatomic, strong, readwrite) NSArray *hotels;

@end

@implementation MockHotelsDataController

- (void)fetchData:(void (^)())completionBlock {
    
    Hotel *mockHotel = [Hotel new];
    
    self.hotels = @[mockHotel];
    
    if (completionBlock) { completionBlock(); }
}

@end
