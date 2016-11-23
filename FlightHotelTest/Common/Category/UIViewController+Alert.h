//
//  UIViewController+Alert.h
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Alert)

- (void)showAlertWithTitle:(nullable NSString *)title
                   message:(nullable NSString *)message
              alertActions:(nonnull NSArray<UIAlertAction *> *)actions;

@end
