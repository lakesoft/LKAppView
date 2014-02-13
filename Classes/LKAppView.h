//
//  LKMyAppAdView.h
//
//  Created by Hiroshi Hashiguchi on 2013/09/07.
//  Copyright (c) 2013年 lakesoft. All rights reserved.
//
#import <StoreKit/StoreKit.h>
#import <UIKit/UIKit.h>

@class LKAppList;
@interface LKAppView : UITableView

@property (weak, nonatomic) IBOutlet UIViewController* viewCotnroller;
@property (strong, nonatomic) UIColor* textColor;

- (void)setup;
- (void)openStoreAtIndex:(NSUInteger)index;
- (IBAction)openStore:(UIControl*)sender;

@end
