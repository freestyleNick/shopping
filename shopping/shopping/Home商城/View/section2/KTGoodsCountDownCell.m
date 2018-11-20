//
//  KTGoodsCountDownCell.m
//  shopping
//
//  Created by nike on 2018/11/17.
//  Copyright © 2018 nike. All rights reserved.
//

#import "KTGoodsCountDownCell.h"
#import "KTGoodsSurplusCell.h"
#import "KTRecommendItem.h"

@interface KTGoodsCountDownCell ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
/** collectView */
@property (nonatomic, strong) UICollectionView *collectView;
/** 全部数据 */
@property (nonatomic, strong) NSMutableArray <KTRecommendItem *> *dataArray;



@end

static NSString * const KTGoodsSurplusCellID = @"KTGoodsSurplusCellID";

@implementation KTGoodsCountDownCell

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
    [self addSubview:self.collectView];
    
    NSArray *countDownArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"CountDownShop.plist" ofType:nil]];
    _dataArray = [KTRecommendItem mj_objectArrayWithKeyValuesArray:countDownArray];
}

- (UICollectionView *)collectView {
    
    if (!_collectView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 1;
        layout.itemSize = CGSizeMake(self.mj_w * 0.38, self.mj_h * 0.9);
        NSLog(@"%@",NSStringFromCGRect(self.frame));
        NSLog(@"%@",NSStringFromCGSize(layout.itemSize));
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

        _collectView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectView.frame = self.bounds;
        _collectView.dataSource = self;
        _collectView.delegate = self;
        _collectView.backgroundColor = self.backgroundColor;
        _collectView.showsHorizontalScrollIndicator = NO;
        
        [_collectView registerNib:[UINib nibWithNibName:NSStringFromClass([KTGoodsSurplusCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:KTGoodsSurplusCellID];
    }
    return _collectView;
}

#pragma mark - <datasource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
   return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    KTGoodsSurplusCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KTGoodsSurplusCellID forIndexPath:indexPath];
    cell.recommendItem = self.dataArray[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"第2组cell，点击了电脑手机第%zi个item",indexPath.row);
}


@end
