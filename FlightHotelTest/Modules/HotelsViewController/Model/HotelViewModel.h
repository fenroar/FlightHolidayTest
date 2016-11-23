//
//  HotelViewModel.h
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Hotel;

@interface HotelViewModel : NSObject

@property (nonatomic, copy, readonly, nonnull) NSString *name;
@property (nonatomic, copy, readonly, nonnull) NSString *location;
@property (nonatomic, copy, readonly, nullable) NSString *imageURL;
@property (nonatomic, copy, readonly, nonnull) NSString *rating;

- (nonnull instancetype)initWithHotel:(nonnull Hotel *)hotel;

@end
