//
//  CommonListViewController.h
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CommonDataController;

@interface CommonListViewController : UIViewController

- (void)refreshData;

- (void)handleResponse:(nullable id)response error:(nullable NSError *)error;

- (void)setup;

- (nonnull CommonDataController *)currentDataController;

@end
