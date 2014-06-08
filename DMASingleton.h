//
//  DMASingleton.h
//  Digital Magazine
//
//  Created by Austen Johnson on 6/7/14.
//  Copyright (c) 2014 Austen Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMASingleton : NSObject

+ (DMASingleton *)sharedCollection;

@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nonatomic) NSDate * endDate;
@property (nonatomic) NSDate * beginDate;
@property (nonatomic) NSMutableDictionary * assets;

@property (nonatomic) NSMutableArray * localPhotoAssets;



- (void)setupArchitecture;

- (NSArray *)allDictionaries;

@end
