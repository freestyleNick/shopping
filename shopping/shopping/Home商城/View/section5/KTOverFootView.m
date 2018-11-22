//
//  KTOverFootView.m
//  shopping
//
//  Created by nike on 2018/11/22.
//  Copyright © 2018 nike. All rights reserved.
//

#import "KTOverFootView.h"

@interface KTOverFootView ()
/** label */
@property (nonatomic, strong) UILabel *overLabel;

@end

@implementation KTOverFootView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI {
    _overLabel = [[UILabel alloc] init];
    _overLabel.textAlignment = NSTextAlignmentCenter;
    _overLabel.text = @"看完喽，下次再逛吧";
    _overLabel.textColor = [UIColor darkGrayColor];
    _overLabel.font = [UIFont systemFontOfSize:14.0];
    [self addSubview:_overLabel];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    [_overLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
    }];
}

@end
