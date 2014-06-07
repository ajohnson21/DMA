//
//  DMACollectionViewCell.m
//  Digital Magazine
//
//  Created by Austen Johnson on 6/7/14.
//  Copyright (c) 2014 Austen Johnson. All rights reserved.
//

#import "DMACollectionViewCell.h"
#import "DMACollectionVC.h"
#import "DMASingleton.h"

@implementation DMACollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 80, 150, 150)];
        self.imageView.backgroundColor = [UIColor lightGrayColor];
        
        self.captionLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 240, 150, 30)];
        self.captionLabel.backgroundColor = [UIColor whiteColor];
        self.captionLabel.textAlignment = NSTextAlignmentCenter;
        self.captionLabel.text = @"Caption";

        self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 60, 20)];
        self.dateLabel.backgroundColor = [UIColor whiteColor];
        self.dateLabel.text = @"Date";

        self.locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 20, 90, 20)];
        self.locationLabel.backgroundColor = [UIColor whiteColor];
        self.locationLabel.textAlignment = NSTextAlignmentCenter;
        self.locationLabel.text = @"Location";
        
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.captionLabel];
        [self.contentView addSubview:self.dateLabel];
        [self.contentView addSubview:self.locationLabel];
    
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
