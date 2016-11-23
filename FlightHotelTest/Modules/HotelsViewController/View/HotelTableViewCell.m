//
//  HotelTableViewCell.m
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import "HotelTableViewCell.h"
#import "HotelViewModel.h"

@interface HotelTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *hotelNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *hotelLocationLabel;
@property (weak, nonatomic) IBOutlet UILabel *hotelRatingLabel;

@end

@implementation HotelTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)populateCellForViewModel:(HotelViewModel *)viewModel {
    
    self.hotelNameLabel.text = viewModel.name;
    self.hotelLocationLabel.text = viewModel.location;
    self.hotelRatingLabel.text = viewModel.rating;
}

@end
