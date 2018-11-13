//
//  KTHomeTopNavView.m
//  shopping
//
//  Created by nike on 2018/11/12.
//  Copyright © 2018 nike. All rights reserved.
//

#import "KTHomeTopNavView.h"

@interface KTHomeTopNavView ()
@property (weak, nonatomic) IBOutlet UIButton *adfbutton;
@property (weak, nonatomic) IBOutlet UIButton *safsfdsfgButton;

@end

@implementation KTHomeTopNavView

+ (instancetype)HomeTopNavView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

@end
