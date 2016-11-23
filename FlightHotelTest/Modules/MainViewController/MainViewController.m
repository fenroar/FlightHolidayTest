//
//  MainViewController.m
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import "MainViewController.h"
#import "FlightsViewController.h"
#import "HotelsViewController.h"

@interface MainViewController ()

@property (nonatomic, strong) FlightsDataController *flightsDataController;

@property (nonatomic, strong) HotelsDataController *hotelsDataController;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setup];
}

#pragma mark - Setup

- (void)setup {
    
    self.title = NSLocalizedString(@"FlightHoliday", @"MainViewController - Title");
    
    self.flightsDataController = [FlightsDataController new];
    self.hotelsDataController = [HotelsDataController new];
}

#pragma mark - Actions

- (IBAction)handleFlightButtonTap:(id)sender {
    
    FlightsViewController *flightsViewController = [[FlightsViewController alloc] initWithDataController:self.flightsDataController];
    
    [self.navigationController pushViewController:flightsViewController animated:YES];
}

- (IBAction)handleHotelButtonTap:(id)sender {
    
    HotelsViewController *hotelsViewController = [[HotelsViewController alloc] initWithDataController:self.hotelsDataController];
    
    [self.navigationController pushViewController:hotelsViewController animated:YES];
}

@end
