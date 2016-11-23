//
//  HotelsDataController.m
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import "HotelsDataController.h"

@interface HotelsDataController ()

@property (nonatomic, strong, readwrite, nonnull) NSArray<Hotel *> *hotels;

@end

@implementation HotelsDataController

- (instancetype)init {
    if (self = [super init]) {
        self.hotels = @[];
    }
    return self;
}

@end
