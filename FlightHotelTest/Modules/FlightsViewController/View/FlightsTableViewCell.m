//
//  FlightsTableViewCell.m
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import "FlightsTableViewCell.h"
#import "FlightViewModel.h"

@interface FlightsTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *sourceDestinationLabel;
@property (weak, nonatomic) IBOutlet UILabel *departureDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *airlineLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIView *separator;

@end

@implementation FlightsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)populateCellForViewModel:(FlightViewModel *)viewModel {
    
    self.sourceDestinationLabel.text = viewModel.sourceDestination;
    self.departureDateLabel.text = viewModel.depatureDate;
    self.timeLabel.text = viewModel.time;
    self.airlineLabel.text = viewModel.airline;
    self.priceLabel.text = viewModel.price;
}

@end
