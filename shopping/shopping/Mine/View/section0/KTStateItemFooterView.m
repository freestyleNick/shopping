//
//  KTStateItemFooterView.m
//  shopping
//
//  Created by nike on 2018/11/29.
//  Copyright © 2018 nike. All rights reserved.
//

#import "KTStateItemFooterView.h"

@implementation KTStateItemFooterView

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
    _footImageView = [[UIImageView alloc] init];
    [self addSubview:_footImageView];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    [_footImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(DCMargin);
        make.bottom.mas_equalTo(self).offset(DCMargin);
        make.left.right.mas_equalTo(self);
    }];
}

@end
