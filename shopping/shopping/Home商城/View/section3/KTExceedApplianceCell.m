//
//  KTExceedApplianceCell.m
//  shopping
//
//  Created by nike on 2018/11/20.
//  Copyright © 2018 nike. All rights reserved.
//

#import "KTExceedApplianceCell.h"

#import "KTGoodsHandheldCell.h"


@interface KTExceedApplianceCell ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
/** collectionView */
@property (nonatomic, strong) UICollectionView *collectView;
/** headView */
@property (nonatomic, strong) UIImageView *headImageView;
/** 图片数据 */
@property (nonatomic, strong) NSArray *imageArray;

@end

static NSString * const KTGoodsHandheldCellID = @"KTGoodsHandheldCellID1";

@implementation KTExceedApplianceCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI {
    
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.headImageView];
    [self addSubview:self.collectView];
}

- (UICollectionView *)collectView {
    if (!_collectView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(100, 100);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectView.frame = CGRectMake(0, ScreenW * 0.35 + 10, ScreenW, 100);
        _collectView.showsHorizontalScrollIndicator = NO;
        _collectView.delegate = self;
        _collectView.dataSource = self;
        _collectView.backgroundColor = [UIColor whiteColor];
        
        [_collectView registerClass:[KTGoodsHandheldCell class] forCellWithReuseIdentifier:KTGoodsHandheldCellID];
    }
    return _collectView;
}

- (UIImageView *)headImageView {
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.mj_w, self.mj_w *0.32)];
    }
    return _headImageView;
}

- (void)setGoodExceedArray:(NSArray *)goodExceedArray {
    _goodExceedArray = goodExceedArray;
    _imageArray = goodExceedArray;
    
    [_headImageView sd_setImageWithURL:[NSURL URLWithString:goodExceedArray[0]]];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _imageArray.count - 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    KTGoodsHandheldCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KTGoodsHandheldCellID forIndexPath:indexPath];
    cell.handheldImage = self.imageArray[indexPath.row + 1];
    return cell;
}

#pragma mark - <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"第3组cell，点击了微波炉冰箱的第%zd个cell",indexPath.row);
}


@end
