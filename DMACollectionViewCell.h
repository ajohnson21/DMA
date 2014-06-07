//
//  DMACollectionViewCell.h
//  Digital Magazine
//
//  Created by Austen Johnson on 6/7/14.
//  Copyright (c) 2014 Austen Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMACollectionViewCell : UICollectionViewCell

@property (nonatomic) UIImageView * imageView;
@property (nonatomic) UILabel * captionLabel;
@property (nonatomic) UILabel * dateLabel;
@property (nonatomic) UILabel * locationLabel;

@end
