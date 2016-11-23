//
//  UIViewController+Alert.m
//  FlightHotelTest
//
//  Created by Peter Su on 23/11/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import "UIViewController+Alert.h"

@implementation UIViewController (Alert)

- (void)showAlertWithTitle:(nullable NSString *)title
                   message:(nullable NSString *)message
              alertActions:(nonnull NSArray<UIAlertAction *> *)actions {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    if (actions.count > 0) {
        
        for (UIAlertAction *action in actions) {
            [alertController addAction:action];
        }
    } else {
        
        // Add default action
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"Alert - OK")
                                                                style:UIAlertActionStyleDefault
                                                              handler:nil];
        [alertController addAction:defaultAction];
    }
    
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
