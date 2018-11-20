//
//  KTGoodsSurplusCell.m
//  shopping
//
//  Created by nike on 2018/11/19.
//  Copyright © 2018 nike. All rights reserved.
//

#import "KTGoodsSurplusCell.h"
#import "KTRecommendItem.h"


@interface KTGoodsSurplusCell ()

/* 图片 */
@property (strong , nonatomic) IBOutlet UIImageView *goodsImageView;
/* 价格 */
@property (strong , nonatomic) IBOutlet UILabel *priceLabel;
/* 剩余 */
@property (strong , nonatomic) IBOutlet UILabel *stockLabel;
/* 属性 */
@property (strong , nonatomic) IBOutlet UILabel *natureLabel;

@end

@implementation KTGoodsSurplusCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setRecommendItem:(KTRecommendItem *)recommendItem {
    _recommendItem = recommendItem;
    
    _priceLabel.text = ([recommendItem.price integerValue] >= 10000) ? [NSString stringWithFormat:@"¥ %.2f万",[recommendItem.price floatValue] / 10000.0] : [NSString stringWithFormat:@"¥ %.2f",[recommendItem.price floatValue]];
    
    _stockLabel.text = [NSString stringWithFormat:@"仅剩：%@件",recommendItem.stock];
    
    _natureLabel.text = recommendItem.nature;
    
    [_goodsImageView sd_setImageWithURL:[NSURL URLWithString:recommendItem.image_url]];
}


@end
