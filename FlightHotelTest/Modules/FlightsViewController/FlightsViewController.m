//
//  FlightsViewController.m
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import "FlightsViewController.h"
#import "UIViewController+Alert.h"

@interface FlightsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong, readwrite) FlightsDataController *dataController;

@end

@implementation FlightsViewController

- (instancetype)initWithDataController:(FlightsDataController *)dataController {
    
    if (self = [super initWithNibName:@"FlightsViewController" bundle:nil]) {
        self.dataController = dataController;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.dataController fetchData:^(id  _Nullable response, NSError * _Nullable error) {
        
        [self handleResponse:response error:error];
    }];
}

- (void)setup {
    [super setup];
    
    self.title = NSLocalizedString(@"Flights", @"FlightsViewController - Title");
}

- (CommonDataController *)currentDataController {
    return self.dataController;
}

@end
