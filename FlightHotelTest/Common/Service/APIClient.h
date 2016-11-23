//
//  APIClient.h
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Flight;
@class Hotel;

@interface APIClient : NSObject

- (void)fetchFlights:(void (^ _Nonnull)(NSArray<Flight *> * _Nonnull flights, NSError * _Nullable error))completion;
- (void)fetchHotels:(void (^ _Nonnull)(NSArray<Hotel *> * _Nonnull flights, NSError * _Nullable error))completion;

@end
