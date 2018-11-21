//
//  KTScrollAdFootView.m
//  shopping
//
//  Created by nike on 2018/11/20.
//  Copyright © 2018 nike. All rights reserved.
//

#import "KTScrollAdFootView.h"

@interface KTScrollAdFootView ()<SDCycleScrollViewDelegate>
/** 轮播图 */
@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;

@end

@implementation KTScrollAdFootView

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
    
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ScreenW, self.mj_h) delegate:self placeholderImage:nil];
    _cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    _cycleScrollView.autoScrollTimeInterval = 3.0;
    _cycleScrollView.imageURLStringsGroup = GoodsFooterImagesArray;
    
    [self addSubview:_cycleScrollView];
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"第3组footer,点击了滚动广告第%zi个图片",index);
}


@end
