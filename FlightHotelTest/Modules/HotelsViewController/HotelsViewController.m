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
    
    [self.dataController fetchData:^{
        [self.tableView reloadData];
    }];
}

- (void)setup {
    
    self.title = NSLocalizedString(@"Hotels", @"HotelsViewController - Title");
    
    for (NSString *cellIdentifier in self.dataController.cellIdentifiers) {
        
        [self.tableView registerNib:[UINib nibWithNibName:cellIdentifier bundle:nil] forCellReuseIdentifier:cellIdentifier];
    }
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self.dataController;
    self.tableView.dataSource = self.dataController;
}

@end
