//
//  KTGoodsGridCell.m
//  shopping
//
//  Created by nike on 2018/11/13.
//  Copyright © 2018 nike. All rights reserved.
//

#import "KTGoodsGridCell.h"
#import "KTGridItem.h"

@interface KTGoodsGridCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *grideTitle;
@property (weak, nonatomic) IBOutlet UILabel *grideTag;
@end

@implementation KTGoodsGridCell

- (void)setGridItem:(KTGridItem *)gridItem {
    
}

@end
