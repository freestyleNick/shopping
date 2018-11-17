//
//  KTGrideItemCell.m
//  shopping
//
//  Created by nike on 2018/11/15.
//  Copyright © 2018 nike. All rights reserved.
//

#import "KTGrideItemCell.h"
#import "KTGridItem.h"

// Categories
#import "UIView+DCRolling.h"
#import "UIColor+DCColorChange.h"

@interface KTGrideItemCell ()
@property (weak, nonatomic) IBOutlet UIImageView *itemImage;
@property (weak, nonatomic) IBOutlet UILabel *itemTitle;
@property (weak, nonatomic) IBOutlet UILabel *itemTag;

@end

@implementation KTGrideItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [DCSpeedy dc_chageControlCircularWith:self AndSetCornerRadius:5 SetBorderWidth:1 SetBorderColor:[UIColor whiteColor] canMasksToBounds:YES];
}

- (void)setGrideItem:(KTGridItem *)grideItem {
    _grideItem = grideItem;
    _itemTitle.text = grideItem.gridTitle;
    _itemTag.text = grideItem.gridTag;
    
    _itemTag.hidden = (grideItem.gridTag.length == 0) ? YES : NO;
    _itemTag.textColor = [UIColor dc_colorWithHexString:grideItem.gridColor];
    
    //设置label圆角和边框
    [DCSpeedy dc_chageControlCircularWith:_itemTag AndSetCornerRadius:5 SetBorderWidth:1 SetBorderColor:_itemTag.textColor canMasksToBounds:YES];
    
    if (_grideItem.iconImage.length == 0) return;
    
    [self.itemImage sd_setImageWithURL:[NSURL URLWithString:grideItem.iconImage] placeholderImage:[UIImage imageNamed:@"default_49_11"]];
    
}

@end
