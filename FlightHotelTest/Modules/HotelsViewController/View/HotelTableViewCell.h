//
//  HotelTableViewCell.h
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HotelViewModel;

@interface HotelTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageView;

- (void)populateCellForViewModel:(HotelViewModel *)viewModel;

@end
