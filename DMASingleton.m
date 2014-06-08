//
//  DMASingleton.m
//  Digital Magazine
//
//  Created by Austen Johnson on 6/7/14.
//  Copyright (c) 2014 Austen Johnson. All rights reserved.
//

#import "DMASingleton.h"

//@property (nonatomic) NSMutableArray * travelItems;


@implementation DMASingleton
{
    NSMutableDictionary * chosenImages;
    NSMutableDictionary * chosenCaptions;
    NSMutableDictionary * chosenDates;
    NSMutableDictionary * chosenLocations;
}

+(DMASingleton *)sharedCollection
{
    static dispatch_once_t create;
    static DMASingleton * singleton = nil;
    
    dispatch_once(&create, ^{
        singleton = [[DMASingleton alloc] init];
    });
    return singleton;
}

- (void)setupArchitecture
{
    chosenImages = [@{} mutableCopy];
    chosenCaptions = [@{} mutableCopy];
    chosenDates = [@{} mutableCopy];
    chosenLocations = [@{} mutableCopy];
}

- (NSArray *)allDictionaries
{
    return @[
             chosenImages,
             chosenCaptions,
             chosenDates,
             chosenLocations
             ];
}

- (NSMutableDictionary *)assets
{
    _assets = [@{
                @"url" : @"",
                @"caption" : @"",
                @"date" : @"",
                @"location" : @""
                } mutableCopy];
    
    return _assets;
}



@end
