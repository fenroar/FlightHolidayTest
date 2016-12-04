//
//  CommonDataController.m
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import "CommonDataController.h"

@implementation CommonDataController

- (nonnull NSArray<NSString *> *)cellIdentifiers {
    return @[];
}

- (void)reset {
    
}

- (void)fetchData:(void (^ _Nullable)(id _Nullable response, NSError * _Nullable error))completionBlock {
    
}

- (void)refreshData:(void (^ _Nonnull)(id _Nullable, NSError * _Nullable))completionBlock {
    
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [UITableViewCell new];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

@end
