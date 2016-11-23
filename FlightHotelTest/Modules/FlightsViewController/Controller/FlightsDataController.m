//
//  FlightsDataController.m
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import "FlightsDataController.h"
#import "FlightsTableViewCell.h"
#import "APIClient.h"
#import "FlightViewModel.h"

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

- (void)fetchData:(void (^)(id _Nullable, NSError * _Nullable))completionBlock {
    
    if (self.flights.count > 0) {
        
        if (completionBlock) {
            completionBlock(self.flights, nil);
        }
    } else {
        
        APIClient *client = [APIClient new];
        [client fetchFlights:^(NSArray<Flight *> * _Nonnull flights, NSError * _Nullable error) {
            
            self.flights = flights;
            
            if (completionBlock) {
                completionBlock(self.flights, error);
            }
        }];
    }
    
}

- (NSArray<NSString *> *)cellIdentifiers {
    
    return @[ NSStringFromClass(FlightsTableViewCell.class)];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.flights.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FlightsTableViewCell *cell = (FlightsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass(FlightsTableViewCell.class)];
    
    Flight *flight = self.flights[indexPath.row];
    FlightViewModel *viewModel = [[FlightViewModel alloc] initWithFlight:flight];
    
    [cell populateCellForViewModel:viewModel];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 135;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    if ([self.delegate respondsToSelector:@selector(dataController:didSelectFlight:)]) {
        Flight *flight = self.flights[indexPath.row];
        [self.delegate dataController:self didSelectFlight:flight];
    }
}

@end
