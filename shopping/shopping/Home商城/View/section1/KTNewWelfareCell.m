//
//  KTNewWelfareCell.m
//  shopping
//
//  Created by nike on 2018/11/16.
//  Copyright © 2018 nike. All rights reserved.
//

#import "KTNewWelfareCell.h"
#import "KTNewWelfareLayout.h"
#import "KTGoodsHandheldCell.h"

@interface KTNewWelfareCell ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, KTNewWelfareLayoutDelegate>

/** collectionView */
@property (nonatomic, strong) UICollectionView *collectionView;


@end

static NSString *const KTGoodsHandheldCellID = @"KTGoodsHandheldCellID";

@implementation KTNewWelfareCell

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        KTNewWelfareLayout *layout = [[KTNewWelfareLayout alloc] init];
        layout.delegate = self;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.frame = self.bounds;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [self addSubview:_collectionView];
        
        [_collectionView registerClass:[KTGoodsHandheldCell class] forCellWithReuseIdentifier:KTGoodsHandheldCellID];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ElementKindSectionHeader"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"ElementKindSectionFooter"];
    }
    return _collectionView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpBase];
    }
    return self;
}

- (void)setUpBase {
    self.backgroundColor = [UIColor whiteColor];
    self.collectionView.backgroundColor = self.backgroundColor;
}

#pragma mark - datesource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    KTGoodsHandheldCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KTGoodsHandheldCellID forIndexPath:indexPath];
    NSArray *images = GoodsNewWelfareImagesArray;
    cell.handheldImage = images[indexPath.row];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ElementKindSectionHeader" forIndexPath:indexPath];
        return headerView;
    }else if (kind == UICollectionElementKindSectionFooter) {
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"ElementKindSectionFooter" forIndexPath:indexPath];
        footerView.backgroundColor = [UIColor clearColor];
        return footerView;
    }
    return [UICollectionReusableView new];
}

#pragma mark - item点击
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.oneCellBlock != nil) {
        self.oneCellBlock(indexPath.row);
    }
//    NSLog(@"第1组cell--点击了国美第%zd个item",indexPath.row);
    
}

#pragma mark - DCItemSortLayoutDelegate
#pragma mark - 底部高度

-(CGFloat)kt_HeightOfSectionFooterForIndexPath:(NSIndexPath *)indexPath {
    return DCMargin;
}
#pragma mark - 头部高度
-(CGFloat)kt_HeightOfSectionHeaderForIndexPath:(NSIndexPath *)indexPath {
    return 0;
}


@end
