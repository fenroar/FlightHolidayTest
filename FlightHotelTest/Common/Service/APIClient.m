//
//  APIClient.m
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import "APIClient.h"
#import "AFNetworking.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "MTLJSONAdapter.h"
#import "Flight.h"
#import "Hotel.h"

static NSString * const GetFlightsPath = @"https://pastebin.com/raw/bFnZQEx0";
static NSString * const GetHotelsPath = @"https://pastebin.com/raw/f0Tm6bfy";

@interface APIClient ()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation APIClient

- (void)fetchFlights:(void (^ _Nonnull)(NSArray<Flight *> * _Nonnull flights, NSError * _Nullable error))completion {
    
    AFHTTPSessionManager *manager = [self sessionManager];
    
    [manager GET:GetFlightsPath
      parameters:nil
        progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *response = [APIClient parseResponseToDictionary:responseObject];
            NSArray *responseArray = [response valueForKey:@"flights"];
            
            if (responseArray) {
                NSError *parseError;
                NSArray<Flight *> *flights = [MTLJSONAdapter modelsOfClass:Flight.class fromJSONArray:responseArray error:&parseError];
                
                if (parseError) {
                    completion(@[], parseError);
                } else {
                    completion(flights, nil);
                }
            } else {
                completion(@[], nil);
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            completion(@[], error);
        }];
}


- (void)fetchHotels:(void (^ _Nonnull)(NSArray<Hotel *> * _Nonnull flights, NSError * _Nullable error))completion {
    
    AFHTTPSessionManager *manager = [self sessionManager];
    
    [manager GET:GetHotelsPath
      parameters:nil
        progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSDictionary *response = [APIClient parseResponseToDictionary:responseObject];
            
            NSError *parseError;
            Hotel *hotel = [MTLJSONAdapter modelOfClass:Hotel.class fromJSONDictionary:response error:&parseError];
            
            if (parseError) {
                completion(@[], parseError);
            } else {
                completion(@[hotel], nil);
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            completion(@[], error);
        }];
}

#pragma mark - Helpers

- (AFHTTPSessionManager *)sessionManager {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = nil;
    
    return manager;
}

+ (NSDictionary *)parseResponseToDictionary:(id)responseObject {
    
    NSError* error;
    NSDictionary* jsonDictionary = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                   options:kNilOptions
                                                                     error:&error];
    
    if (error) {
        NSLog(@"%@", error.localizedDescription);
        return @{};
    } else {
        return jsonDictionary;
    }
}

+ (NSDictionary *)dictionaryForError:(NSError *)error {
    NSData *errorData = error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
    return [NSJSONSerialization JSONObjectWithData: errorData options:kNilOptions error:nil];
}

@end
