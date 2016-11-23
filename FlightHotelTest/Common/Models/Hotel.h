//
//  Hotel.h
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Hotel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly, nullable) NSString *name;
@property (nonatomic, copy, readonly, nullable) NSString *locationName;
@property (nonatomic, copy, readonly, nullable) NSString *descriptive;
@property (nonatomic, strong, readonly, nullable) NSArray<NSString *> *images;
@property (nonatomic, readonly) NSInteger rating;
@property (nonatomic, strong, readonly, nullable) NSArray<NSString *> *facilities;

@end
