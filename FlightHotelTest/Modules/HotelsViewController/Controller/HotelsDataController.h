//
//  HotelsDataController.h
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import "CommonDataController.h"

@class Hotel;

@protocol HotelsDataControllerDelegate;

@interface HotelsDataController : CommonDataController

@property (nonatomic, strong, readonly, nonnull) NSArray<Hotel *> *hotels;

@property (weak, nonatomic, nullable) id<HotelsDataControllerDelegate> delegate;

- (void)refreshData:(void (^ _Nonnull)(id _Nullable, NSError * _Nullable))completionBlock;

@end

@protocol HotelsDataControllerDelegate <NSObject>

- (void)dataController:(nonnull HotelsDataController *)dataController didSelectHotel:(nonnull Hotel *)hotel;

@end
