//
//  LKMyAppAdList.m
//
//  Created by Hiroshi Hashiguchi on 2013/09/07.
//  Copyright (c) 2013年 lakesoft. All rights reserved.
//

#import "LKAppList.h"
#define ApplicationName         @"ApplicationName"
#define ITunesItemIdentifier    @"ITunesItemIdentifier"
#define IconFilename            @"IconFilename"
#define Labels                  @"Labels"
#define BundleIdentifier        @"BundleIdentifier"

@interface LKAppList ()
@property (strong, nonatomic) NSMutableArray* list;
@end

@implementation LKAppList

#pragma mark -
#pragma mark Privates


#pragma mark -
#pragma mark Basics
- (id)init
{
    self = [super init];
    if(self) {
        NSString* filePath = [NSBundle.mainBundle pathForResource:NSStringFromClass(LKAppList.class) ofType:@"plist"];
        self.list = [NSMutableArray arrayWithContentsOfFile:filePath];
        
        NSString* bundleIdentifier = NSBundle.mainBundle.bundleIdentifier;
        // remove own app
        for (NSDictionary* item in self.list) {
            if ([bundleIdentifier isEqualToString:item[BundleIdentifier]]) {
                [self.list removeObject:item];
                break;
            }
        }
    }
    return self;
}


#pragma mark -
#pragma mark Utilities

#pragma mark -
#pragma mark API
- (NSUInteger)count
{
    return self.list.count;
}

- (NSString*)labelForKey:(NSString*)key atIndex:(NSUInteger)index
{
    NSString* localeIdentifer = NSLocale.preferredLanguages[0];
    NSDictionary* labels = self.list[index][Labels];
    NSString* label = labels[localeIdentifer][key];
    if (label == nil) {
        label = labels[@"en"][key];
    }
    return label;
}

- (UIImage*)iconImageAtIndex:(NSUInteger)index
{
    return [UIImage imageNamed:self.list[index][ITunesItemIdentifier]];
}


- (NSString*)iTunesItemIdentifierAtIndex:(NSUInteger)index
{
    return self.list[index][ITunesItemIdentifier];
}


@end
