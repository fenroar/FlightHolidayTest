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
static NSString * const GetHotelPath = @"http://pastebin.com/raw/f0Tm6bfy";

@interface APIClient ()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation APIClient

//+ (instancetype)sharedInstance {
//    static APIClient *sharedInstance = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        sharedInstance = [[self alloc] init];
//    });
//    return sharedInstance;
//}
//
//- (instancetype)init {
//    
//    if (self = [super init]) {
//        
//        self.sessionManager = [AFHTTPSessionManager alloc] initWithBaseURL: sessionConfiguration:<#(nullable NSURLSessionConfiguration *)#>
//        
//        [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
//    }
//    
//    return self;
//}

- (void)fetchFlights:(void (^ _Nonnull)(NSArray<Flight *> * _Nonnull flights, NSError * _Nullable error))completion {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = nil;
    
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


- (void)fetchHotels {
    
}

#pragma mark - Helpers

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
