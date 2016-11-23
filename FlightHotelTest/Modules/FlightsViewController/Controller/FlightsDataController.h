//
//  FlightsDataController.h
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

@import UIKit;
#import "FlightsTableViewCell.h"

@protocol FlightsDataControllerDelegate;

@interface FlightsDataController : NSObject <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong, readonly, nonnull) NSArray *flights;

@property (weak, nonatomic, nullable) id<FlightsDataControllerDelegate> delegate;

- (nonnull NSArray<NSString *> *)cellIdentifiers;

- (void)fetchData:(void (^ _Nullable)())completionBlock;

@end

@protocol FlightsDataControllerDelegate <NSObject>

@end
