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

@implementation KTMineController

#pragma mark - initialize
- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero];
        _tableView.frame = CGRectMake(0, 0, ScreenW, ScreenH - KTabBarH - 49);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_tableView];
        
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
    
//    self.tableView.backgroundColor = [UIColor grayColor];
}


#pragma mark - 获取数据
- (void)setUpData
{
    _serviceItem = [KTGridItem mj_objectArrayWithFilename:@"MyServiceFlow.plist"];
}

#pragma mark - datasoure
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//
//}

@end
