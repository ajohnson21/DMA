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

@property (nonatomic) float latitude;
@property (nonatomic) float longitude;
@property (nonatomic) NSDate * endDate;
@property (nonatomic) NSDate * beginDate;
@property (nonatomic) NSMutableDictionary * assets;

- (void)setupArchitecture;

- (NSArray *)allDictionaries;

@end
