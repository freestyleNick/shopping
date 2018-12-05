//
//  KTMineController.m
//  shopping
//
//  Created by nike on 2018/11/28.
//  Copyright © 2018 nike. All rights reserved.
//

#import "KTMineController.h"
#import "KTMineHeaderView.h"
#import "KTGridItem.h"
#import "KTCenterItemCell.h"

#import "KTCenterServiceCell.h"

@interface KTMineController ()<UITableViewDelegate, UITableViewDataSource>
/** tableView */
@property (nonatomic, strong) UITableView *tableView;
/** 头部背景图片 */
@property (nonatomic, strong) UIImageView *headBgImageView;
/** headView */
@property (nonatomic, strong) KTMineHeaderView *headerView;



/** 服务器数据 */
@property (nonatomic, strong) NSMutableArray *serviceItem;


@end

static NSString * const KTCenterItemCellID = @"KTCenterItemCellID";
static NSString * const KTCenterServiceCellID = @"KTCenterServiceCellID";

@implementation KTMineController

#pragma mark - initialize
- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero];
        _tableView.frame = CGRectMake(0, -KStatusH, ScreenW, ScreenH - KTabBarH - 49);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_tableView];
        
        [_tableView registerClass:[KTCenterItemCell class] forCellReuseIdentifier:KTCenterItemCellID];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([KTCenterServiceCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:KTCenterServiceCellID];
    }
    return _tableView;
}

- (UIImageView *)headBgImageView {
    
    if (!_headBgImageView) {
        NSInteger armNum = [DCSpeedy dc_GetRandomNumber:1 to:9];
        _headBgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"mine_main_bg_%zd",armNum]]];
        _headBgImageView.backgroundColor = [UIColor greenColor];
        _headBgImageView.contentMode = UIViewContentModeScaleAspectFill;
        _headBgImageView.clipsToBounds = YES;
    }
    return _headBgImageView;
}

- (KTMineHeaderView *)headerView {
    
    if (!_headerView) {
        _headerView = [KTMineHeaderView dc_viewFromXib];
        _headerView.frame = CGRectMake(0, 0, ScreenW, 200);
    }
    return _headerView;
}

- (NSMutableArray *)serviceItem {
    if (!_serviceItem) {
        _serviceItem = [NSMutableArray array];
    }
    return _serviceItem;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpData];
    
    [self setUpUI];
    
    [self setUpHeaderCenterView];
}

- (void)setUpUI {
    
    self.view.backgroundColor = KTBGColor;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.backgroundColor = KTBGColor;
    self.tableView.tableFooterView = [UIView new];//去除分割线

}
#pragma mark - 初始化头部
- (void)setUpHeaderCenterView{
    
    self.tableView.tableHeaderView = self.headerView;
    self.headBgImageView.frame = self.headerView.bounds;
    [self.headerView insertSubview:self.headBgImageView atIndex:0]; //将背景图片放到最底层
}

#pragma mark - 获取数据
- (void)setUpData
{
    _serviceItem = [KTGridItem mj_objectArrayWithFilename:@"MyServiceFlow.plist"];
}

#pragma mark - datasoure
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    if (indexPath.section == 0) {
        KTCenterItemCell * itemCell = [tableView dequeueReusableCellWithIdentifier:KTCenterItemCellID forIndexPath:indexPath];
        cell = itemCell;
    }else if (indexPath.section == 1) {
        KTCenterServiceCell * serCell = [tableView dequeueReusableCellWithIdentifier:KTCenterServiceCellID forIndexPath:indexPath];
        serCell.serviceItemArray = [NSMutableArray arrayWithArray:_serviceItem];
        cell = serCell;
    }
    return cell;
}

#pragma mark - delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = 0;
    if (indexPath.section == 0) {
        height = 180;
    }else if (indexPath.section == 1) {
        height = 215;
    }
    return height;
}

#pragma mark - 滚动tableview 完毕之后
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
//    _topToolView.hidden = (scrollView.contentOffset.y < 0) ? YES : NO;
//
//    _topToolView.backgroundColor = (scrollView.contentOffset.y > 64) ? RGB(0, 0, 0) : [UIColor clearColor];
    
    //图片高度
    CGFloat imageHeight = self.headerView.dc_height;
    //图片宽度
    CGFloat imageWidth = ScreenW;
    //图片上下偏移量
    CGFloat imageOffsetY = scrollView.contentOffset.y;
    //上移
    if (imageOffsetY < 0) {
        CGFloat totalOffset = imageHeight + ABS(imageOffsetY);
        CGFloat f = totalOffset / imageHeight;
        self.headBgImageView.frame = CGRectMake(-(imageWidth * f - imageWidth) * 0.5, imageOffsetY, imageWidth * f, totalOffset);
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
