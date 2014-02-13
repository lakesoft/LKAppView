//
//  LKMyAppAdList.h
//
//  Created by Hiroshi Hashiguchi on 2013/09/07.
//  Copyright (c) 2013年 lakesoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LKAppList : NSObject

// API
- (NSUInteger)count;
- (NSString*)labelForKey:(NSString*)key atIndex:(NSUInteger)index;
- (UIImage*)iconImageAtIndex:(NSUInteger)index;
- (NSString*)iTunesItemIdentifierAtIndex:(NSUInteger)index;
@end
