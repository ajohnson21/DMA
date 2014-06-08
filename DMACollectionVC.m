//
//  DMACollectionVC.m
//  Digital Magazine
//
//  Created by Austen Johnson on 6/7/14.
//  Copyright (c) 2014 Austen Johnson. All rights reserved.
//

#import "DMACollectionVC.h"
#import "DMACollectionViewCell.h"
#import "DMASingleton.h"
#import "DMAViewController.h"  // VC for map

@interface DMACollectionVC () <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation DMACollectionVC
{
    NSMutableArray *entries;
}

-(id)initWithCollectionViewLayout:(UICollectionViewFlowLayout *)layout
{
    self = [super initWithCollectionViewLayout:layout];
    if (self)
    {
        self.collectionView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        entries = [@[
                   @"1",
                   @"2",
                   @"3",
                   @"4",
                   @"5",
                   @"6",
                   @"7",
                   @"8",
                   @"9"
                   ] mutableCopy];
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [entries count];
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((SCREEN_WIDTH - 50) / 3.0, (SCREEN_HEIGHT - 50) / 3.0);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DMACollectionViewCell * cell = (DMACollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    UILabel * title = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, cell.frame.size.width - 20, 30)];
    [cell.contentView addSubview:title];
    
    title.text = entries[indexPath.row];
    title.textColor = [UIColor darkGrayColor];
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
}

- (void)viewWillLayoutSubviews
{
//    [super viewDidLoad];
    
    [self.collectionView registerClass:[DMACollectionViewCell class] forCellWithReuseIdentifier:@"cell"];

    self.navigationController.navigationBarHidden = NO;

    UIButton *mapButton =  [UIButton buttonWithType:UIButtonTypeCustom];
    [mapButton addTarget:self action:@selector(mapView)forControlEvents:UIControlEventTouchUpInside];
    [mapButton setFrame:CGRectMake(0, 0, 53, 31)];
   
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(3, 5, 50, 20)];
    [label setFont:[UIFont fontWithName:@"AmericanTypewriter-Condensed" size:20]];
    [label setText:@"Map"];
    label.textAlignment = NSTextAlignmentCenter;
    [label setTextColor:[UIColor colorWithRed:0.000f green:0.478f blue:1.000f alpha:1.0f]];
    [label setBackgroundColor:[UIColor clearColor]];
    [mapButton addSubview:label];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:mapButton];
    self.navigationItem.rightBarButtonItem = barButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapView
{
   
    
    
    DMAViewController *mapload = [[DMAViewController alloc] init];
    [self.navigationController pushViewController:mapload animated:NO];

    
}

@end
