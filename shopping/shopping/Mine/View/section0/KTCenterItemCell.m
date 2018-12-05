//
//  KTCenterItemCell.m
//  shopping
//
//  Created by nike on 2018/11/28.
//  Copyright © 2018 nike. All rights reserved.
//

#import "KTCenterItemCell.h"
#import "KTStateItem.h"
#import "KTStateItemCell.h"
#import "KTStateItemFooterView.h"

@interface KTCenterItemCell ()<UICollectionViewDelegate, UICollectionViewDataSource>
/** collectView */
@property (nonatomic, strong) UICollectionView *collectView;
/** 所有数据 */
@property (nonatomic, strong) NSMutableArray *stateItem;

@end

static NSString * const KTStateItemCellID = @"KTStateItemCellID";
static NSString * const KTStateItemFooterViewID = @"KTStateItemFooterViewID";

@implementation KTCenterItemCell

- (UICollectionView *)collectView {
    
    if (!_collectView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        _collectView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectView.frame = CGRectMake(0, 0, ScreenW, 180);
        
        _collectView.delegate = self;
        _collectView.dataSource = self;
        _collectView.showsVerticalScrollIndicator = NO;
        
        [_collectView registerNib:[UINib nibWithNibName:NSStringFromClass([KTStateItemCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:KTStateItemCellID];
        [_collectView registerClass:[KTStateItemFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:KTStateItemFooterViewID];
        
        [self addSubview:_collectView];
    }
    return _collectView;
}

- (NSMutableArray *)stateItem {
    
    if (!_stateItem) {
        _stateItem = [NSMutableArray array];
    }
    return _stateItem;
}

#pragma mark - Intial
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI {
    
    self.backgroundColor = [UIColor whiteColor];
    self.collectView.backgroundColor = KTBGColor;
    _stateItem = [KTStateItem mj_objectArrayWithFilename:@"MyCenterFlow.plist"];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

#pragma mark - delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _stateItem.count;
}


#pragma mark - datasource
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    KTStateItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KTStateItemCellID forIndexPath:indexPath];
    cell.stateItem = _stateItem[indexPath.row];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *reusableView = nil;
    if (kind == UICollectionElementKindSectionFooter) {
        KTStateItemFooterView *footView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:KTStateItemFooterViewID forIndexPath:indexPath];
        reusableView = footView;
    }
    
    return reusableView;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(ScreenW / 5, 90);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(ScreenW, 0);
}


@end
