//
//  KTGoodsHandheldCell.m
//  shopping
//
//  Created by nike on 2018/11/16.
//  Copyright © 2018 nike. All rights reserved.
//

#import "KTGoodsHandheldCell.h"

@interface KTGoodsHandheldCell ()

@end

@implementation KTGoodsHandheldCell

#pragma mark - Intial
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpUI];
    }
    return self;
}

#pragma mark - UI
- (void)setUpUI
{
    _handheldImageView = [[UIImageView alloc] init];
    _handheldImageView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:_handheldImageView];
}

#pragma mark - 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_handheldImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}

#pragma mark - Setter Getter Methods
- (void)setHandheldImage:(NSString *)handheldImage
{
    _handheldImage = handheldImage;
    
    [_handheldImageView sd_setImageWithURL:[NSURL URLWithString:handheldImage]];
}


@end
