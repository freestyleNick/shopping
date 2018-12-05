//
//  KTStateItemCell.m
//  shopping
//
//  Created by nike on 2018/11/28.
//  Copyright © 2018 nike. All rights reserved.
//

#import "KTStateItemCell.h"
#import "KTStateItem.h"

@interface KTStateItemCell ()
@property (weak, nonatomic) IBOutlet UIButton *stateBtn;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *stateBgImage;

@end

@implementation KTStateItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = [UIColor whiteColor];
}

- (void)setStateItem:(KTStateItem *)stateItem {
    
    _stateItem = stateItem;
    
    self.stateBgImage.backgroundColor = (stateItem.bgColor) ? RGB(240, 240, 240) : [UIColor whiteColor];
    if (stateItem.showImage) {
        [self.stateBtn setImage:[UIImage imageNamed:stateItem.imageContent] forState:0];
    }else{
        [self.stateBtn setTitle:stateItem.imageContent forState:0];
    }
    
    self.stateLabel.text = stateItem.stateTitle;
}

@end
