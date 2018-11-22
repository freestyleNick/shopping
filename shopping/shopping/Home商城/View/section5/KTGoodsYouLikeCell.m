//
//  KTGoodsYouLikeCell.m
//  shopping
//
//  Created by nike on 2018/11/21.
//  Copyright © 2018 nike. All rights reserved.
//

#import "KTGoodsYouLikeCell.h"
#import "KTRecommendItem.h"

@interface KTGoodsYouLikeCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageIcon;
@property (weak, nonatomic) IBOutlet UILabel *goodLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIButton *sameBtn;

@end

@implementation KTGoodsYouLikeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setCommendItem:(KTRecommendItem *)commendItem {
    
    _commendItem = commendItem;
    _priceLabel.text = [NSString stringWithFormat:@"¥ %.2f",[commendItem.price floatValue]];
    _goodLabel.text = commendItem.main_title;
    [_imageIcon sd_setImageWithURL:[NSURL URLWithString:commendItem.image_url]];

    [DCSpeedy dc_chageControlCircularWith:_sameBtn AndSetCornerRadius:0 SetBorderWidth:1.0 SetBorderColor:[UIColor darkGrayColor] canMasksToBounds:YES];
}



@end
