//
//  FlightsViewController.m
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import "FlightsViewController.h"
#import "UIScrollView+EmptyDataSet.h"
#import "EmptyView.h"

@interface FlightsViewController () <DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

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
    
    [self.tableView setContentOffset:CGPointZero animated:NO];
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
    
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
    
    self.title = NSLocalizedString(@"Flights", @"FlightsViewController - Title");
}

- (CommonDataController *)currentDataController {
    return self.dataController;
}

- (void)refreshData {
    
    [self.dataController refreshData:^(id _Nullable response, NSError * _Nullable error) {
       
        [self handleResponse:response error:error];
    }];
}

#pragma mark - DZNEmptyDataSetSource, DZNEmptyDataSetDelegate

- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView {
    return YES;
}

//- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView {
//    
//}

- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView {
    
    [scrollView layoutIfNeeded];
    
    EmptyView *emptyView = [[EmptyView alloc] initWithFrame:scrollView.frame];
//    emptyView.translatesAutoresizingMaskIntoConstraints = false;

//    NSLayoutConstraint *heightConstraint = [emptyView.leadingAnchor constraintEqualToAnchor:scrollView.leadingAnchor multiplier:0 constant:0];
//    [heightConstraint setActive:YES];
//    
//    NSLayoutConstraint *widthConstraint = [emptyView.trailingAnchor constraintEqualToAnchor:scrollView.trailingAnchor multiplier:0 constant:0];
//    [widthConstraint setActive:YES];
    
    return emptyView;
}

@end
