//
//  KTMineHeaderView.m
//  shopping
//
//  Created by nike on 2018/11/28.
//  Copyright © 2018 nike. All rights reserved.
//

#import "KTMineHeaderView.h"

@interface KTMineHeaderView ()
@property (weak, nonatomic) IBOutlet UIButton *seeMyVipBtn;

@end

@implementation KTMineHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    [DCSpeedy dc_chageControlCircularWith:_myIconImage AndSetCornerRadius:_myIconImage.mj_w * 0.5 SetBorderWidth:1 SetBorderColor:[UIColor whiteColor] canMasksToBounds:YES];
    
    _seeMyVipBtn.backgroundColor = RGB(252, 246, 213);
    [DCSpeedy dc_chageControlCircularWith:_seeMyVipBtn AndSetCornerRadius:10 SetBorderWidth:1 SetBorderColor:_seeMyVipBtn.backgroundColor canMasksToBounds:YES];
}

- (IBAction)seeMyheadBtnClick:(id)sender {
    NSLog(@"%s",__func__);
}

- (IBAction)seeMyVipBtnClick:(id)sender {
    NSLog(@"%s",__func__);

}
- (IBAction)seeMyFriendCycleClick:(id)sender {
    NSLog(@"%s",__func__);

}
- (IBAction)seeMyFriendClick:(id)sender {
    NSLog(@"%s",__func__);

}
- (IBAction)twoqrcodeClick:(id)sender {
    NSLog(@"%s",__func__);

}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
