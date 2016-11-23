//
//  HotelsViewControllerTests.m
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HotelsViewController.h"
#import "MockHotelsDataController.h"

@interface HotelsViewControllerTests : XCTestCase

@property (nonatomic, strong) HotelsViewController *hotelsViewController;

@end

@implementation HotelsViewControllerTests

- (void)setUp {
    [super setUp];
    
    MockHotelsDataController *dataController = [MockHotelsDataController new];
    self.hotelsViewController = [[HotelsViewController alloc] initWithDataController:dataController];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = self.hotelsViewController;
    
    UIView *view = self.hotelsViewController.view;
    NSLog(@"%@", NSStringFromCGRect(view.frame));
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFlightsViewController {
    // create the expectation with a nice descriptive message
    XCTestExpectation *expectation = [self expectationWithDescription:@"The request should successfully complete within the specific timeframe."];
    
    [self.hotelsViewController.dataController fetchData:^(id  _Nullable response, NSError * _Nullable error) {
        
        if (self.hotelsViewController.dataController.hotels.count > 0) {
            [expectation fulfill];
        }
    }];
    
    // wait for the expectations to be called and timeout after some
    // predefined max time limit, failing the test automatically
    NSTimeInterval somePredefinedTimeout = 30;
    [self waitForExpectationsWithTimeout:somePredefinedTimeout handler:^(NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

@end
