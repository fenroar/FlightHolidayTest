//
//  FlightsDataController.m
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import "FlightsDataController.h"

@interface FlightsDataController ()

@property (nonatomic, strong, readwrite) NSArray *flights;

@end

@implementation FlightsDataController

- (instancetype)init {
    if (self = [super init]) {
        self.flights = @[];
    }
    return self;
}

#pragma mark - Public

- (void)fetchData:(void (^ _Nullable)())completionBlock {
    
    if (completionBlock) { completionBlock(); }
}

- (NSArray<NSString *> *)cellIdentifiers {
    
    return @[ NSStringFromClass(FlightsTableViewCell.class)];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.flights.count + 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FlightsTableViewCell *cell = (FlightsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass(FlightsTableViewCell.class)];
    
    [cell populateCell];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 135;
}

@end
