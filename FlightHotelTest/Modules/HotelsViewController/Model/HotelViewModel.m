//
//  HotelViewModel.m
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import "HotelViewModel.h"
#import "Hotel.h"

@interface HotelViewModel ()

@property (nonatomic, copy, readwrite, nonnull) NSString *name;
@property (nonatomic, copy, readwrite, nonnull) NSString *location;
@property (nonatomic, copy, readwrite, nullable) NSString *imageURL;
@property (nonatomic, copy, readwrite, nonnull) NSString *rating;

@end

@implementation HotelViewModel

- (nonnull instancetype)initWithHotel:(nonnull Hotel *)hotel {
    
    if (self = [super init]) {
        
    }
    
    return self;
}

@end
