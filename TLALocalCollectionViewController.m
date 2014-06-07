//
//  GLACollectionViewController.m
//  GridLayout
//
//  Created by Ali Houshmand on 5/30/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//



#import "TLALocalCollectionViewController.h"
#import "TLALocalCollectionViewCell.h"
#import <AssetsLibrary/AssetsLibrary.h>


@interface TLALocalCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate>

@property (nonatomic, strong) NSArray * assets;

@end

@implementation TLALocalCollectionViewController
{
    
    
}

-(id)initWithCollectionViewLayout:(UICollectionViewFlowLayout *)layout
{
    self = [super initWithCollectionViewLayout:layout];
    if(self)
    {
        [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
        self.collectionView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
        
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        layout.sectionInset = UIEdgeInsetsMake(10, 0, 10, 0);
        

    
    }
    return self;
}

+ (ALAssetsLibrary *)defaultAssetsLibrary
{
    static dispatch_once_t pred = 0;
    static ALAssetsLibrary *library = nil;
    dispatch_once(&pred, ^{
        library = [[ALAssetsLibrary alloc] init];
    });
    return library;
}

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
//{
//     
//    
//}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    

    return self.assets.count;
    

}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return CGSizeMake(( SCREEN_WIDTH - 30) / 3.0, (SCREEN_HEIGHT - 30) / 4.0);
    
}



-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    
    return 4.0;
}


-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    
    return 10.0;
    
}



-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    

    NSLog(@"did select cell");
    
    
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    TLALocalCollectionViewCell * cell = (TLALocalCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
  
    ALAsset * asset = self.assets[indexPath.row];
    cell.asset = asset;
    
    
//    for (asset in self.assets)
//    {
//        NSDate * date = [asset valueForProperty:ALAssetPropertyDate];
//    
//        if ([date timeIntervalSinceReferenceDate] > [dateWnd timeIntervalSinceReferenceDate])
//        {
//            cell.asset = asset;
//        }
//    }
  
    
      cell.backgroundColor = [UIColor colorWithWhite:0.50 alpha:.90];
      cell.layer.cornerRadius = 5;
      [cell.layer setBorderWidth:1];
      [cell.layer setBorderColor:[UIColor lightGrayColor].CGColor];

    
    return cell;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // had to insert this to get rid of unrecognized selector crash
    [self.collectionView registerClass:[TLALocalCollectionViewCell class] forCellWithReuseIdentifier:@"PhotoCell"];

    // new code from tutorial
    _assets = [@[] mutableCopy];
    __block NSMutableArray * tmpAssets = [@[] mutableCopy];
    
    // 1
    ALAssetsLibrary *assetsLibrary = [TLALocalCollectionViewController defaultAssetsLibrary];
    
    // 2
    [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
    [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
            if(result)
            {
    // 3
            [tmpAssets addObject:result];
                
            }
        }];
        
    // 4
    // NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:NO];
    // self.assets = [tmpAssets sortedArrayUsingDescriptors:@[sort]];
    
    self.assets = tmpAssets;
    
        
    // 5
    
        [self.collectionView reloadData];
    }   failureBlock:^(NSError *error) {
        NSLog(@"Error loading images %@", error);
    
    }];
    
 
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
