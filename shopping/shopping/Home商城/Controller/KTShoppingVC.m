//
//  KTShoppingVC.m
//  shopping
//
//  Created by nike on 2018/11/10.
//  Copyright © 2018 nike. All rights reserved.
//

#import "KTShoppingVC.h"
#import "KTHomeTopNavView.h"

#import "KTCycleTopView.h"
#import "KTGridItem.h"
#import "KTGrideItemCell.h"
#import "KTTopLineFootView.h"

#import "KTNewWelfareCell.h"

#import "KTCountDownHeadView.h"
#import "KTGoodsCountDownCell.h"


@interface KTShoppingVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
/* 自定义导航栏 */
@property (nonatomic, strong) KTHomeTopNavView *topToolView;
/* collectionView */
@property (nonatomic, strong) UICollectionView *collectionView;
/** 第0组cell10个上面模型数据 */
@property (strong , nonatomic)NSMutableArray<KTGridItem *> *gridItem;
/** 第0组cell最顶部head轮播图 */
@property (nonatomic, strong) KTCycleTopView *cycleTopView;
/* 滚回顶部按钮 */
@property (strong , nonatomic)UIButton *backTopButton;
@end

/** 第0组cell */
//最顶部轮播视图ID
static NSString * const KTCycleTopViewID = @"KTCycleTopViewID";
//手机充值等10个itemID
static NSString * const KTGrideItemCellID = @"KTGrideItemCellID";
/** foot广告和滚动标题 */
static NSString * const KTTopLineFootViewID = @"KTTopLineFootViewID";

/** 第1组cell */
//国美等3个itemID
static NSString * const KTNewWelfareCellID = @"KTNewWelfareCellID";

/** 第2组cell */
static NSString * const KTCountDownHeadViewID = @"KTCountDownHeadViewID";
static NSString * const KTGoodsCountDownCellID = @"KTGoodsCountDownCellID";



@implementation KTShoppingVC

- (KTHomeTopNavView *)topToolView {
    if (!_topToolView) {
        _topToolView = [KTHomeTopNavView HomeTopNavView];
        _topToolView.frame = CGRectMake(0, 0, kScreenWidth, KNaviH);
    }
    return _topToolView;
}

- (UICollectionView *)collectionView {
    
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.frame = CGRectMake(0, 0, ScreenW, ScreenH - KTabBarH);
        _collectionView.backgroundColor = KTBGColor;
        _collectionView.showsVerticalScrollIndicator = NO;        //注册

        // Register cell classes(用nib写的注册nib加载，其他注册class加载)
        //        [_collectionView registerClass:[KTGrideItemCell class] forCellWithReuseIdentifier:KTGrideItemCellID];加载不出来的
        //注册头部
        [_collectionView registerClass:[KTCycleTopView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:KTCycleTopViewID];
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([KTGrideItemCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:KTGrideItemCellID];
        [_collectionView registerClass:[KTTopLineFootView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:KTTopLineFootViewID];
        
        [_collectionView registerClass:[KTNewWelfareCell class] forCellWithReuseIdentifier:KTNewWelfareCellID];
        
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([KTCountDownHeadView class]) bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:KTCountDownHeadViewID];
        [_collectionView registerClass:[KTGoodsCountDownCell class] forCellWithReuseIdentifier:KTGoodsCountDownCellID];
        
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = KTBGColor;
    
    [self setupUI];
    
    _gridItem = [KTGridItem mj_objectArrayWithFilename:@"GoodsGrid.plist"];

    
    _backTopButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_backTopButton];
    [_backTopButton addTarget:self action:@selector(ScrollToTop) forControlEvents:UIControlEventTouchUpInside];
    [_backTopButton setImage:[UIImage imageNamed:@"btn_UpToTop"] forState:UIControlStateNormal];
    _backTopButton.hidden = YES;
    _backTopButton.frame = CGRectMake(ScreenW - 50, ScreenH - 110, 40, 40);

}

- (void)ScrollToTop {
    [self.collectionView reloadData];
}

- (void)setupUI {
    //添加collectionView
    [self.view addSubview:self.collectionView];
    //添加自定义导航栏
    [self.view addSubview:self.topToolView];

}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return self.gridItem.count;
    }else if (section == 1 || section == 2) {
        return 1;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *KTcell = nil;
    if (indexPath.section == 0) {
        KTGrideItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KTGrideItemCellID forIndexPath:indexPath];
        cell.grideItem = self.gridItem[indexPath.row];
        KTcell = cell;
    }else if (indexPath.section == 1) {
        KTNewWelfareCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KTNewWelfareCellID forIndexPath:indexPath];
        cell.oneCellBlock = ^(NSInteger indexpath) {
            NSLog(@"第1组cell--点击了国美第%zd个item",indexPath.row);
        };
        KTcell = cell;
    }else if (indexPath.section == 2) {
        KTGoodsCountDownCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KTGoodsCountDownCellID forIndexPath:indexPath];
        KTcell = cell;
    }
    
    return KTcell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader){
        if (indexPath.section == 0) {//最顶端轮播图
            KTCycleTopView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:KTCycleTopViewID forIndexPath:indexPath];
            headerView.imageGroupArray = GoodsHomeSilderImagesArray;
            reusableview = headerView;
        }else if (indexPath.section == 2) {
            KTCountDownHeadView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:KTCountDownHeadViewID forIndexPath:indexPath];
            reusableview = headView;
        }
        
    }
    if (kind == UICollectionElementKindSectionFooter) {
        if (indexPath.section == 0) {//广告git和滚动标题
            KTTopLineFootView *topLineFootView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:KTTopLineFootViewID forIndexPath:indexPath];
            reusableview = topLineFootView;
        }
    
    }
    
    return reusableview;
    
}
#pragma mark - item宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {//9宫格组
        return CGSizeMake((ScreenW)/5 -1-4  , ScreenW/5 + DCMargin -1-2 );
    }else if (indexPath.section == 1) {
        return CGSizeMake(ScreenW, 180);
    }else if (indexPath.section == 2) {
        return CGSizeMake(ScreenW, 150);
    }
    return CGSizeZero;
}


#pragma mark - head宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return CGSizeMake(ScreenW, 230); //图片滚动的宽高
    }else if (section == 2) {
        return CGSizeMake(ScreenW, 40);
    }
    return CGSizeZero;
}

#pragma - foot宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    
    if (section == 0) {
        return CGSizeMake(ScreenW - 50, 160);
    }
    return CGSizeZero;
}

#pragma mark - X间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return (section == 5) ? 4 : 1;
}
#pragma mark - Y间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return (section == 5) ? 4 : 1;
}

#pragma mark - 每个item的四边间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return (section == 0) ? UIEdgeInsetsMake(5, 10, 0, 10) : UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {//10
        NSLog(@"第0组cell---点击了手机充值等10个属性中第%zd个item",indexPath.row);
    }
    if (indexPath.section == 1) {//10
        NSLog(@"第1组cell---点击了手机充值等10个属性中第%zd个item",indexPath.row);
    }

}


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:YES];
    [self.navigationController setNavigationBarHidden:NO animated:animated];

}



@end
