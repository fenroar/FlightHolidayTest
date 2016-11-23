//
//  HotelsViewController.h
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotelsDataController.h"

@interface HotelsViewController : UIViewController

@property (nonatomic, strong, readonly) HotelsDataController *dataController;

- (instancetype)initWithDataController:(HotelsDataController *)dataController;

@end
