//
//  FlightsViewController.h
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlightsDataController.h"

@interface FlightsViewController : UIViewController

@property (nonatomic, strong, readonly) FlightsDataController *dataController;

- (instancetype)initWithDataController:(FlightsDataController *)dataController;

@end
