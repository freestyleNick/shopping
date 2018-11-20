//
//  KTCountDownHeadView.m
//  shopping
//
//  Created by nike on 2018/11/17.
//  Copyright © 2018 nike. All rights reserved.
//

#import "KTCountDownHeadView.h"

#import "DCZuoWenRightButton.h"

@interface KTCountDownHeadView ()

@property (strong , nonatomic)DCZuoWenRightButton *quickButton;

@end

@implementation KTCountDownHeadView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI {
    
    _quickButton = [DCZuoWenRightButton buttonWithType:UIButtonTypeCustom];
    _quickButton.titleLabel.font = PFR12Font;
    [_quickButton setImage:[UIImage imageNamed:@"shouye_icon_jiantou"] forState:UIControlStateNormal];
    [_quickButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_quickButton setTitle:@"好货秒抢" forState:UIControlStateNormal];
    [self addSubview:_quickButton];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _quickButton.frame = CGRectMake(self.dc_width - 70, 0, 70, self.dc_height);
}

@end
