//
//  KTYouLikeHeadView.m
//  shopping
//
//  Created by nike on 2018/11/21.
//  Copyright © 2018 nike. All rights reserved.
//

#import "KTYouLikeHeadView.h"

@implementation KTYouLikeHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI {
    
    _likeImageView = [[UIImageView alloc] init];
    _likeImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_likeImageView];
    
    _likeImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickView)];
    [_likeImageView addGestureRecognizer:tapGes];
}

- (void)clickView {
    NSLog(@"第4组cell，点击了headView");
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    [_likeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.centerY.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(150, 25));
    }];
}

@end
