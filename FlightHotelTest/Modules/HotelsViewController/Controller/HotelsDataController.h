//
//  HotelsDataController.h
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import "CommonDataController.h"

@class Hotel;

@interface HotelsDataController : CommonDataController

@property (nonatomic, strong, readonly, nonnull) NSArray<Hotel *> *hotels;

@end
