//
//  FlightsViewController.m
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import "FlightsViewController.h"

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
    
    NSLog(@"%ld", [self.tableView numberOfRowsInSection:0]);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.dataController fetchData:^{
        NSLog(@"fetchData");
    }];
}

- (void)setup {
    
    for (NSString *cellIdentifier in self.dataController.cellIdentifiers) {
        
        [self.tableView registerNib:[UINib nibWithNibName:cellIdentifier bundle:nil] forCellReuseIdentifier:cellIdentifier];
    }
    
    self.tableView.delegate = self.dataController;
    self.tableView.dataSource = self.dataController;
}

@end
