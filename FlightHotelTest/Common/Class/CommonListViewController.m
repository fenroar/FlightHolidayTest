//
//  CommonListViewController.m
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import "CommonListViewController.h"
#import "CommonDataController.h"
#import "UIViewController+Alert.h"

@interface CommonListViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation CommonListViewController

- (void)refreshData {
    
}

- (void)handleResponse:(nullable id)response error:(nullable NSError *)error {
    
    if (self.refreshControl.isRefreshing) {
        [self.refreshControl endRefreshing];
    }
    
    if (error) {
        [self showAlertWithTitle:NSLocalizedString(@"Oops", @"Error - Title")
                         message:error.localizedDescription
                    alertActions:@[]];
    } else {
        [self.tableView reloadData];
    }
}

- (void)setup {
    
    for (NSString *cellIdentifier in [self currentDataController].cellIdentifiers) {
        
        [self.tableView registerNib:[UINib nibWithNibName:cellIdentifier bundle:nil] forCellReuseIdentifier:cellIdentifier];
    }
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = [self currentDataController];
    self.tableView.dataSource = [self currentDataController];
    
//    self.refreshControl = [[UIRefreshControl alloc] initWithFrame:CGRectZero];
//    [self.refreshControl addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventValueChanged];
//    [self.tableView addSubview:self.refreshControl];
}

- (CommonDataController *)currentDataController {
    return [CommonDataController new];
}

@end
