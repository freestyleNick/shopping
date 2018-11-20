//
//  KTTopLineFootView.m
//  shopping
//
//  Created by nike on 2018/11/16.
//  Copyright © 2018 nike. All rights reserved.
//

#import "KTTopLineFootView.h"

// Views
#import "DCTitleRolling.h"
// Vendors

@interface KTTopLineFootView ()<UIScrollViewDelegate, CDDRollingDelegate>
/** 滚动视图 */
@property (nonatomic, strong) DCTitleRolling *titleRolling;
/** 买手机广告git图 */
@property (nonatomic, strong) UIImageView *topAdGitView;
/** 底部横线 */
@property (nonatomic, strong) UIView *bottomLineView;

@end

@implementation KTTopLineFootView

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
    
    //广告动态图
    _topAdGitView = [[UIImageView alloc] init];
    [_topAdGitView sd_setImageWithURL:[NSURL URLWithString:HomeBottomViewGIFImage]];
    _topAdGitView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_topAdGitView];
    
    //滚动文字
    _titleRolling = [[DCTitleRolling alloc] initWithFrame:CGRectMake(0, self.mj_h - 50, self.mj_w, 50) WithTitleData:^(CDDRollingGroupStyle *rollingGroupStyle, NSString *__autoreleasing *leftImage, NSArray *__autoreleasing *rolTitles, NSArray *__autoreleasing *rolTags, NSArray *__autoreleasing *rightImages, NSString *__autoreleasing *rightbuttonTitle, NSInteger *interval, float *rollingTime, NSInteger *titleFont, UIColor *__autoreleasing *titleColor, BOOL *isShowTagBorder) {
        *rollingTime = 0.25;
        *rolTags = @[@"冬季健康日",@"新手上路",@"年终内购会",@"GitHub星星走一波"];
        *rolTitles = @[@"先领券在购物，一元抢？",@"2000元热门手机推荐",@"好奇么？点进去哈",@"这套家具比房子还贵"];
        *leftImage = @"shouye_img_toutiao";
        *interval = 6.0;
        *titleFont = 14;
        *isShowTagBorder = YES;
        *titleColor = [UIColor darkGrayColor];
    }];
    _titleRolling.moreClickBlock = ^{
        NSLog(@"更多的回调");
    };
    [_titleRolling dc_beginRolling];
    _titleRolling.delegate = self;
    _titleRolling.backgroundColor = [UIColor whiteColor];
    [self addSubview:_titleRolling];
    
    //底部
    _bottomLineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.mj_h - 8, self.mj_w, 8)];
    _bottomLineView.backgroundColor = KTBGColor;
    [self addSubview:_bottomLineView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.frame = CGRectMake(10, self.mj_y, ScreenW - 20, self.mj_h);
    
    [_topAdGitView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self);
        [make.bottom.mas_equalTo(self)setOffset:-30];
    }];
}

#pragma mark - 滚动条点击事件

- (void)dc_RollingViewSelectWithActionAtIndex:(NSInteger)index
{
    NSLog(@"第0组footer---点击了第%zd头条滚动条",index);
}



@end
