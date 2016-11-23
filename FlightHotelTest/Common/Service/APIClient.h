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

typedef void (^ _Nullable Success)(id _Nullable element);
typedef void (^ _Nullable Error)(NSError * _Nonnull error);

@interface APIClient : NSObject

- (void)fetchFlights:(void (^ _Nonnull)(NSArray<Flight *> * _Nonnull flights, NSError * _Nullable error))completion;
- (void)fetchHotels;

@end
