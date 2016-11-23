//
//  HotelsDataController.m
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import "HotelsDataController.h"
#import "HotelTableViewCell.h"
#import "APIClient.h"
#import "HotelViewModel.h"
#import "UIImageView+AFNetworking.h"

@interface HotelsDataController ()

@property (nonatomic, strong, readwrite, nonnull) NSArray<Hotel *> *hotels;

@end

@implementation HotelsDataController

- (instancetype)init {
    if (self = [super init]) {
        self.hotels = @[];
    }
    return self;
}

#pragma mark - Public

- (void)fetchData:(void (^ _Nullable)())completionBlock {
    
    if (self.hotels.count > 0) {
        
        if (completionBlock) {
            completionBlock();
        }
    } else {
        
        APIClient *client = [APIClient new];
        [client fetchHotels:^(NSArray<Hotel *> * _Nonnull hotels, NSError * _Nullable error) {
            
            if (error) {
                NSLog(@"%@", error.localizedDescription);
            } else {
                self.hotels = hotels;
            }
            
            if (completionBlock) { completionBlock(); }
        }];
    }
}

- (NSArray<NSString *> *)cellIdentifiers {
    
    return @[ NSStringFromClass(HotelTableViewCell.class)];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.hotels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HotelTableViewCell *cell = (HotelTableViewCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass(HotelTableViewCell.class)];
    
    Hotel *hotel = self.hotels[indexPath.row];
    HotelViewModel *viewModel = [[HotelViewModel alloc] initWithHotel:hotel];
    
    [cell populateCellForViewModel:viewModel];
    
    // Populate images
    
    if (viewModel.imageURL) {
        
        NSURL *url = [NSURL URLWithString:viewModel.imageURL];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        __weak UITableViewCell *weakCell = cell;
        __weak UIImageView *weakImageView = cell.thumbnailImageView;
        
        [cell.thumbnailImageView setImageWithURLRequest:request
                                       placeholderImage:nil
                                                success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                                    
                                                    weakImageView.image = image;
                                                    [weakCell setNeedsLayout];
                                                    
                                                } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                                    
                                                    weakImageView.image = nil;
                                                    [weakCell setNeedsLayout];
                                                }];
    } else {
        cell.thumbnailImageView.image = nil;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    if ([self.delegate respondsToSelector:@selector(dataController:didSelectHotel:)]) {
        Hotel *hotel = self.hotels[indexPath.row];
        [self.delegate dataController:self didSelectHotel:hotel];
    }
}

@end
