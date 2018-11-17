//
//  KTCycleTopView.m
//  shopping
//
//  Created by nike on 2018/11/14.
//  Copyright © 2018 nike. All rights reserved.
//

#import "KTCycleTopView.h"

@interface KTCycleTopView ()<SDCycleScrollViewDelegate>

@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;

@end

@implementation KTCycleTopView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    self.backgroundColor = [UIColor whiteColor];
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, -KStatusH, kScreenWidth, self.mj_h + KStatusH) delegate:self placeholderImage:nil];
    _cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleToFill;
    _cycleScrollView.autoScrollTimeInterval = 3.0;
    [self addSubview:_cycleScrollView];
}

- (void)setImageGroupArray:(NSArray *)imageGroupArray {
    
    _imageGroupArray = imageGroupArray;
    _cycleScrollView.placeholderImage = [UIImage imageNamed:@"default_160"];
    if (imageGroupArray.count == 0) return;
    _cycleScrollView.imageURLStringsGroup = imageGroupArray;
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    
    NSLog(@"第0组heard---点击了第%zi张轮播图",index);
}

@end
