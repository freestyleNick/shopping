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

@interface KTShoppingVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
/* 顶部工具View */
@property (nonatomic, strong) KTHomeTopNavView *topToolView;
/* collectionView */
@property (nonatomic, strong) UICollectionView *collectionView;
/** 10个上面模型数据 */
@property (strong , nonatomic)NSMutableArray<KTGridItem *> *gridItem;
/** 最顶部heard轮播图 */
@property (nonatomic, strong) KTCycleTopView *cycleTopView;
/* 滚回顶部按钮 */
@property (strong , nonatomic)UIButton *backTopButton;
@end


//最顶部轮播视图ID
static NSString * const KTCycleTopViewID = @"KTCycleTopViewID";
//手机充值等10个itemID
static NSString * const KTGrideItemCellID = @"KTGrideItemCellID";
/** foot广告和滚动标题 */
static NSString * const KTTopLineFootViewID = @"KTTopLineFootViewID";




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

        //注册头部
        [_collectionView registerClass:[KTCycleTopView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:KTCycleTopViewID];
        
        // Register cell classes(用nib写的注册nib加载，其他注册class加载)
        //        [_collectionView registerClass:[KTGrideItemCell class] forCellWithReuseIdentifier:KTGrideItemCellID];加载不出来的
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([KTGrideItemCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:KTGrideItemCellID];
        
        [_collectionView registerClass:[KTTopLineFootView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:KTTopLineFootViewID];
        
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
//    _backTopButton.hidden = YES;
    _backTopButton.frame = CGRectMake(ScreenW - 50, ScreenH - 110, 40, 40);

}

- (void)ScrollToTop {
    [self.collectionView reloadData];
}

- (void)setupUI {
    //添加collectionView
    [self.view addSubview:self.collectionView];
    //添加导航栏
    [self.view addSubview:self.topToolView];
    //改变状态栏颜色
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.gridItem.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    KTGrideItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KTGrideItemCellID forIndexPath:indexPath];
    cell.grideItem = self.gridItem[indexPath.row];
    
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader){
        if (indexPath.section == 0) {//最顶端轮播图
            KTCycleTopView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:KTCycleTopViewID forIndexPath:indexPath];
            headerView.imageGroupArray = GoodsHomeSilderImagesArray;
            reusableview = headerView;
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
    }
    return CGSizeZero;
}


#pragma mark - head宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return CGSizeMake(ScreenW, 230); //图片滚动的宽高
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
