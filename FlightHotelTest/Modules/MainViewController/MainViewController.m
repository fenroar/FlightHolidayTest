//
//  MainViewController.m
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import "MainViewController.h"
#import "UIViewController+Alert.h"
#import "FlightsViewController.h"
#import "HotelsViewController.h"
#import "Booking.h"

@interface MainViewController () <BookingDelegate, FlightsDataControllerDelegate, HotelsDataControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *selectedFlightLabel;
@property (weak, nonatomic) IBOutlet UILabel *selectedHotelLabel;
@property (weak, nonatomic) IBOutlet UIButton *bookingButton;

@property (nonatomic, strong) Booking *booking;
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
    
    self.booking = [Booking new];
    self.booking.delegate = self;
    
    self.flightsDataController = [FlightsDataController new];
    self.flightsDataController.delegate = self;
    
    self.hotelsDataController = [HotelsDataController new];
    self.hotelsDataController.delegate = self;
    
    [self updateUIForBooking:self.booking];
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

- (IBAction)handleBookButtonTap:(id)sender {
    
    __weak typeof(self) weakSelf = self;
    UIAlertAction *action = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"MainViewController - OK")
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * _Nonnull action) {
        weakSelf.booking.flight = nil;
        weakSelf.booking.hotel = nil;
    }];
    
    [self showAlertWithTitle:NSLocalizedString(@"Booked", @"MainViewController - Booked complete title")
                     message:NSLocalizedString(@"Your booking is complete!", @"MainViewController - Booked complete message")
                alertActions:@[action]];
}

#pragma mark - Helpers

- (void)updateUIForBooking:(Booking *)booking {
    
    self.selectedHotelLabel.attributedText = [booking stringForHotelBooking];
    self.selectedFlightLabel.attributedText = [booking stringForFlightBooking];
    
    BOOL valid = [booking bookingIsValid];
    self.bookingButton.enabled = valid;
    self.bookingButton.backgroundColor = valid ? [UIColor blueColor] : [UIColor grayColor];
}

#pragma mark - BookingDelegate

- (void)bookingModified:(Booking *)booking isValid:(BOOL)valid {
 
    [self updateUIForBooking:booking];
}

#pragma mark - FlightsDataControllerDelegate

- (void)dataController:(FlightsDataController *)dataController
       didSelectFlight:(Flight *)flight {
    
    [self.navigationController popViewControllerAnimated:YES];
    self.booking.flight = flight;
}

#pragma mark - HotelsDataControllerDelegate

- (void)dataController:(HotelsDataController *)dataController didSelectHotel:(Hotel *)hotel {
    
    [self.navigationController popViewControllerAnimated:YES];
    self.booking.hotel = hotel;
}

@end
