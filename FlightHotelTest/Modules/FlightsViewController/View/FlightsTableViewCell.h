//
//  FlightsTableViewCell.h
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlightViewModel;

@interface FlightsTableViewCell : UITableViewCell

- (void)populateCellForViewModel:(FlightViewModel *)viewModel;

@end
