//
//  LKMyAppAdView.m
//
//  Created by Hiroshi Hashiguchi on 2013/09/07.
//  Copyright (c) 2013年 lakesoft. All rights reserved.
//

#import "LKAppView.h"
#import "LKAppList.h"
#define LK_APP_TABLE_CELL_HEIGHT    70.0

@interface LKAppView () <SKStoreProductViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) LKAppList* appList;
@end

@implementation LKAppView

#pragma mark -
#pragma mark Privates
- (void)setup
{
    self.backgroundColor = UIColor.clearColor;
    self.appList = LKAppList.new;
    
    self.dataSource = self;
    self.delegate = self;
    self.rowHeight = LK_APP_TABLE_CELL_HEIGHT;
    self.backgroundColor = UIColor.clearColor;
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.scrollEnabled = NO;
}

#pragma mark -
#pragma mark Basics
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}


#pragma mark -
#pragma mark Actions
- (void)openStoreAtIndex:(NSUInteger)index
{
    if (self.viewCotnroller == nil) {
        NSLog(@"[WARN] viewController is null");
    }
    SKStoreProductViewController *storeViewController = [[SKStoreProductViewController alloc] init];
    storeViewController.delegate = self;
    
    [self.viewCotnroller presentViewController:storeViewController animated:YES completion:^() {
        [storeViewController loadProductWithParameters:@{SKStoreProductParameterITunesItemIdentifier:[self.appList iTunesItemIdentifierAtIndex:index]}
                                       completionBlock:^(BOOL result, NSError *error)
         {
             if (!result) {
                 NSLog(@"%@", error);
             }
         }];
    }];
}

- (IBAction)openStore:(UIControl*)sender
{
    [self openStoreAtIndex:sender.tag];
}



#pragma mark -
#pragma mark SKStoreProductViewControllerDelegate
-(void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController
{
    [self.viewCotnroller dismissViewControllerAnimated:YES
                                            completion:^{
                                                nil;
                                            }];
}


#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.appList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        cell.backgroundColor = UIColor.clearColor;
        cell.imageView.contentMode = UIViewContentModeCenter;
        CALayer* layer = cell.imageView.layer;
        layer.masksToBounds = YES;
        layer.cornerRadius = 10.0f;
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:18.0];
        cell.textLabel.textColor = UIColor.darkGrayColor;
        cell.textLabel.adjustsFontSizeToFitWidth = YES;
        cell.detailTextLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:15.0];
        cell.detailTextLabel.textColor = UIColor.darkGrayColor;
        cell.detailTextLabel.adjustsFontSizeToFitWidth = YES;
    }

    
    cell.textLabel.text = [self.appList labelForKey:@"name" atIndex:indexPath.row];
    cell.detailTextLabel.text = [self.appList labelForKey:@"desc" atIndex:indexPath.row];
    
    UIImage* image = [self.appList iconImageAtIndex:indexPath.row];
    CGRect rect = CGRectMake(0, 0, 48, 48);
    UIGraphicsBeginImageContext(rect.size);
    [image drawInRect:rect];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    cell.imageView.image = image;
    return cell;
}


#pragma mark -
#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self openStoreAtIndex:indexPath.row];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



@end

