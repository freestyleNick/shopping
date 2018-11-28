//
//  KTCenterItemCell.m
//  shopping
//
//  Created by nike on 2018/11/28.
//  Copyright © 2018 nike. All rights reserved.
//

#import "KTCenterItemCell.h"
#import "KTStateItem.h"

@interface KTCenterItemCell ()<UICollectionViewDelegate, UICollectionViewDataSource>
/** collectView */
@property (nonatomic, strong) UICollectionView *collectView;
/** 所有数据 */
@property (nonatomic, strong) NSMutableArray *stateItem;



@end


@implementation KTCenterItemCell

- (UICollectionView *)collectView {
    
    if (!_collectView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        _collectView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectView.frame = CGRectMake(0, 0, ScreenW, self.mj_h);
        
        _collectView.delegate = self;
        _collectView.dataSource = self;
        _collectView.showsVerticalScrollIndicator = NO;
        
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
    _stateItem = [KTStateItem mj_objectArrayWithFile:@"MyCenterFlow.plist"];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _stateItem.count;
}

//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//
//}

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//
//}

@end
