//
//  DMAAnnotation.h
//  Digital Magazine
//
//  Created by Austen Johnson on 6/7/14.
//  Copyright (c) 2014 Austen Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "DMATableViewController.h"
#import "DMAViewController.h"

@interface DMAAnnotation : NSObject <MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate;

@end
