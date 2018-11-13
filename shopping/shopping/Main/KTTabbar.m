//
//  KTTabbar.m
//  shopping
//
//  Created by nike on 2018/11/13.
//  Copyright © 2018 nike. All rights reserved.
//

#import "KTTabbar.h"

@implementation KTTabbar

- (void)layoutSubviews {
    [super layoutSubviews];
    
    //tabBarItem 为图片加文字时，改变item y值
    for (UIControl *control in self.subviews) {
        if (![control isKindOfClass:[UIControl class]] || [control isKindOfClass:[UIButton class]]) continue;
        control.mj_y = 9;
    }
}

@end
