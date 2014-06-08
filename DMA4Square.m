//
//  DMA4Square.m
//  Digital Magazine
//
//  Created by Austen Johnson on 6/7/14.
//  Copyright (c) 2014 Austen Johnson. All rights reserved.
//

#import "DMA4Square.h"
#import "DMASingleton.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@implementation DMA4Square

+ (NSArray *) getVenuesWithLat:(double)latitude andLong:(double)longitude
{
    NSArray *venues = @[];
    
    NSString *locationURL = [NSString stringWithFormat:@"https://api.foursquare.com/v2/venues/explore?ll=%f,%f&oauth_token=RO3OCMY1GOZKSSOIQQN4DKX2FNNAQBVQFFND4DMUTIHNIWPA&v=20140605", latitude, longitude];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:locationURL]];
    
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSDictionary *fsInfo = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
    
    venues = fsInfo[@"response"][@"groups"][0][@"items"];
    
    return venues;
}


@end
