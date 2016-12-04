//
//  EmptyView.m
//  FlightHotelTest
//
//  Created by Peter Su on 04/12/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

#import "EmptyView.h"

@interface EmptyView ()

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) NSMutableArray *customConstraints;
@end

@implementation EmptyView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    _customConstraints = [[NSMutableArray alloc] init];
    
    UIView *view = nil;
    NSArray *objects = [[NSBundle mainBundle] loadNibNamed:@"EmptyView"
                                                     owner:self
                                                   options:nil];
    for (id object in objects) {
        if ([object isKindOfClass:[UIView class]]) {
            view = object;
            break;
        }
    }
    
    if (view != nil) {
        _containerView = view;
        [self addSubview:view];
        self.translatesAutoresizingMaskIntoConstraints = NO;
        view.translatesAutoresizingMaskIntoConstraints = NO;
        
        [[self.leadingAnchor constraintEqualToAnchor:view.leadingAnchor] setActive:YES];
        [[self.trailingAnchor constraintEqualToAnchor:view.trailingAnchor] setActive:YES];
        [[self.topAnchor constraintEqualToAnchor:view.topAnchor] setActive:YES];
        [[self.bottomAnchor constraintEqualToAnchor:view.bottomAnchor] setActive:YES];
    }
}

- (CGSize)intrinsicContentSize {
    return CGSizeMake(UIViewNoIntrinsicMetric, UILayoutFittingCompressedSize.height);
}

- (IBAction)buttonTapped:(id)sender {
    NSLog(@"Did press button");
}

@end
