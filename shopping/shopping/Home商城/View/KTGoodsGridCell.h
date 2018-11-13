//
//  KTGoodsGridCell.h
//  shopping
//
//  Created by nike on 2018/11/13.
//  Copyright © 2018 nike. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class KTGridItem;

@interface KTGoodsGridCell : UICollectionViewCell

/* 10个属性数据 */
@property (strong , nonatomic)KTGridItem *gridItem;

@end

NS_ASSUME_NONNULL_END
