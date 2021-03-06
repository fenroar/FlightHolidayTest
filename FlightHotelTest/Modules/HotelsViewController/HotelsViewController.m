//
//  HotelsViewController.m
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import "HotelsViewController.h"

@interface HotelsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong, readwrite) HotelsDataController *dataController;

@end

@implementation HotelsViewController

- (instancetype)initWithDataController:(HotelsDataController *)dataController {
    
    if (self = [super initWithNibName:@"HotelsViewController" bundle:nil]) {
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
    
    self.title = NSLocalizedString(@"Hotels", @"HotelsViewController - Title");
}

- (CommonDataController *)currentDataController {
    return self.dataController;
}

- (void)refreshData {
    
    [self.dataController refreshData:^(id _Nullable response, NSError * _Nullable error) {
        
        [self handleResponse:response error:error];
    }];
}

@end
