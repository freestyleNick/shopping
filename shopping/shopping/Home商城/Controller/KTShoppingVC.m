//
//  KTShoppingVC.m
//  shopping
//
//  Created by nike on 2018/11/10.
//  Copyright © 2018 nike. All rights reserved.
//

#import "KTShoppingVC.h"
#import "KTHomeTopNavView.h"
#import "KTGridItem.h"

@interface KTShoppingVC ()
/* 顶部工具View */
@property (nonatomic, strong) KTHomeTopNavView *topToolView;
/* collectionView */
@property (nonatomic, strong) UICollectionView *collectionView;
@property (strong , nonatomic)NSMutableArray<KTGridItem *> *gridItem;

@end

@implementation KTShoppingVC

- (KTHomeTopNavView *)topToolView {
    if (!_topToolView) {
        _topToolView = [KTHomeTopNavView HomeTopNavView];
        _topToolView.frame = CGRectMake(0, 0, kScreenWidth, KNaviH);
    }
    return _topToolView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = KTBGColor;
    
    //添加导航栏
    [self.view addSubview:self.topToolView];
    
    _gridItem = [KTGridItem mj_objectArrayWithFilename:@"GoodsGrid.plist"];

//    _gridItem[0].;
    KTGridItem *item = _gridItem[0];
    NSLog(@"==%@=-%@--=%@---==%@",item.gridTag,item.gridColor,item.gridTitle,item.iconImage);
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
