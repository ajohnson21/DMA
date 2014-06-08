//
//  DMASocialContent.m
//  Digital Magazine
//
//  Created by Austen Johnson on 6/8/14.
//  Copyright (c) 2014 Austen Johnson. All rights reserved.
//

#import "DMASocialContent.h"
#import "DMASingleton.h"

@implementation DMASocialContent

+(void)updateData
{
    NSURL * requestURL = [NSURL URLWithString:[NSString stringWithFormat:@"test.com"]];
    NSURLRequest * request = [NSURLRequest requestWithURL:requestURL];
    
    NSOperationQueue * queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request queue: queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSArray * socialInfo = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        for (NSDictionary * photoInfo in socialInfo)
        {
            

        }
     
        
    }];

}
     
@end
