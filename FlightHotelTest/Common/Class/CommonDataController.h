//
//  CommonDataController.h
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonDataController : NSObject <UITableViewDelegate, UITableViewDataSource>

- (nonnull NSArray<NSString *> *)cellIdentifiers;

- (void)fetchData:(void (^ _Nullable)(id _Nullable response, NSError * _Nullable error))completionBlock;

@end
