//
//  MTLModel+Transform.h
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface MTLModel (Transform)

/** 
 Transforms price from JSON to NSDecimalNumber 
 */
+ (MTLValueTransformer *)priceTransformer;

/** 
 Transforms date string into NSDate  
 */
+ (MTLValueTransformer *)iso8601ToDateTransformer;

@end
