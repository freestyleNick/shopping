//
//  KTCenterServiceCell.m
//  shopping
//
//  Created by nike on 2018/11/29.
//  Copyright © 2018 nike. All rights reserved.
//

#import "KTCenterServiceCell.h"

#import "KTGrideItemCell.h"

@interface KTCenterServiceCell ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) IBOutlet UIView *topTitleView;

/** collectionView */
@property (nonatomic, strong) UICollectionView *collectionView;

@end

static NSString * const KTGrideItemCellID = @"KTGrideItemCellID";

@implementation KTCenterServiceCell

- (UICollectionView *)collectionView {
    
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        [self addSubview:_collectionView];
        
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([KTGrideItemCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:KTGrideItemCellID];
    }
    return _collectionView;
}

- (void)awakeFromNib {
    [super awakeFromNib];

    self.backgroundColor = [UIColor clearColor];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.top.mas_equalTo(self.topTitleView.mas_bottom);
        [make.bottom.mas_equalTo(self)setOffset:-DCMargin];
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - datasoure
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _serviceItemArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    KTGrideItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KTGrideItemCellID forIndexPath:indexPath];
    cell.grideItem = _serviceItemArray[indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(ScreenW / 4, 85);
}

@end
