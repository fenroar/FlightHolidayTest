//
//  FlightsDataController.h
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import "CommonDataController.h"

@protocol FlightsDataControllerDelegate;

@interface FlightsDataController : CommonDataController

@property (nonatomic, strong, readonly, nonnull) NSArray *flights;

@property (weak, nonatomic, nullable) id<FlightsDataControllerDelegate> delegate;

@end

@protocol FlightsDataControllerDelegate <NSObject>

@end
