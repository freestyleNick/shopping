//
//  KTHomeTopNavView.m
//  shopping
//
//  Created by nike on 2018/11/12.
//  Copyright © 2018 nike. All rights reserved.
//

#import "KTHomeTopNavView.h"

@interface KTHomeTopNavView ()
@property (weak, nonatomic) IBOutlet UIView *topSearchView;

@property (weak, nonatomic) IBOutlet UIButton *leftItemButton;
@property (weak, nonatomic) IBOutlet UIButton *rightItemButton;
@property (weak, nonatomic) IBOutlet UIButton *rightRItemButton;
/** 通知 */
@property (weak ,nonatomic) id dcObserve;


@end

@implementation KTHomeTopNavView

- (void)layoutSubviews {
    [self acceptanceNote];
}

- (void)acceptanceNote {
    
    //滚动到详情
    WEAKSELF;
    _dcObserve = [[NSNotificationCenter defaultCenter]addObserverForName:SHOWTOPTOOLVIEW object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        weakSelf.backgroundColor = [UIColor whiteColor];
        weakSelf.topSearchView.backgroundColor = RGB(240, 240, 240);
        [weakSelf.leftItemButton setImage:[UIImage imageNamed:@"shouye_icon_scan_gray"] forState:0];
        [weakSelf.rightItemButton setImage:[UIImage imageNamed:@"shouye_icon_sort_gray"] forState:0];
        [weakSelf.rightRItemButton setImage:[UIImage imageNamed:@"icon_gouwuche_title_gray"] forState:0];
    }];
    
    _dcObserve = [[NSNotificationCenter defaultCenter]addObserverForName:HIDETOPTOOLVIEW object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        weakSelf.backgroundColor = [UIColor clearColor];
        weakSelf.topSearchView.backgroundColor = [UIColor whiteColor];
        [weakSelf.leftItemButton setImage:[UIImage imageNamed:@"shouye_icon_scan_white"] forState:0];
        [weakSelf.rightItemButton setImage:[UIImage imageNamed:@"shouye_icon_sort_white"] forState:0];
        [weakSelf.rightRItemButton setImage:[UIImage imageNamed:@"icon_gouwuche_title_white"] forState:0];
    }];
    
}

#pragma mark - 消失
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:_dcObserve];
}


+ (instancetype)HomeTopNavView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

@end
