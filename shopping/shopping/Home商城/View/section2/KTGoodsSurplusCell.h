//
//  KTGoodsSurplusCell.h
//  shopping
//
//  Created by nike on 2018/11/19.
//  Copyright © 2018 nike. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class KTRecommendItem;
@interface KTGoodsSurplusCell : UICollectionViewCell

/** 商品数据 */
@property (nonatomic, strong) KTRecommendItem *recommendItem;


@end

NS_ASSUME_NONNULL_END
