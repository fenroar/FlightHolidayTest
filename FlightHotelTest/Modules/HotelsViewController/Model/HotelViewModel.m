//
//  HotelViewModel.m
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import "HotelViewModel.h"
#import "Hotel.h"

static const double kHotelMaxRating = 5;

@interface HotelViewModel ()

@property (nonatomic, copy, readwrite, nonnull) NSString *name;
@property (nonatomic, copy, readwrite, nonnull) NSString *location;
@property (nonatomic, copy, readwrite, nullable) NSString *imageURL;
@property (nonatomic, copy, readwrite, nonnull) NSString *rating;

@end

@implementation HotelViewModel

- (nonnull instancetype)initWithHotel:(nonnull Hotel *)hotel {
    
    if (self = [super init]) {
        
        self.name = hotel.name ? hotel.name : @"N/A";
        
        self.location = hotel.locationName ? hotel.locationName : @"N/A";
        
        if (hotel.images && hotel.images.count > 0) {
            self.imageURL = hotel.images.firstObject;
        }
        
        if (hotel.rating) {
            self.rating = [NSString stringWithFormat:@"%.01f / %.01f", hotel.rating, kHotelMaxRating];
        } else {
            self.rating = @"N/A";
        }
    }
    
    return self;
}

@end
