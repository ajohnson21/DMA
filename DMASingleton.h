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
@property (nonatomic) NSString * endDate;
@property (nonatomic) NSString * beginDate;

- (void)setupArchitecture;

- (NSArray *)allDictionaries;

@end
