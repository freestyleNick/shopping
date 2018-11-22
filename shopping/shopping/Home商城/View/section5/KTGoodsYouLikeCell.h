//
//  KTGoodsYouLikeCell.h
//  shopping
//
//  Created by nike on 2018/11/21.
//  Copyright © 2018 nike. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@class KTRecommendItem;

@interface KTGoodsYouLikeCell : UICollectionViewCell
/** 推荐数据模型 */
@property (nonatomic, strong) KTRecommendItem *commendItem;


@end

NS_ASSUME_NONNULL_END
