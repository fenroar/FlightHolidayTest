//
//  FlightsViewController.h
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import "CommonListViewController.h"
#import "FlightsDataController.h"

@interface FlightsViewController : CommonListViewController

@property (nonatomic, strong, readonly) FlightsDataController *dataController;

- (instancetype)initWithDataController:(FlightsDataController *)dataController;

@end
