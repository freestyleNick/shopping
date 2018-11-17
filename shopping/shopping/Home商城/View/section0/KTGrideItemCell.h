//
//  KTGrideItemCell.h
//  shopping
//
//  Created by nike on 2018/11/15.
//  Copyright © 2018 nike. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class KTGridItem;
@interface KTGrideItemCell : UICollectionViewCell
/** 全部数据模型 */
@property (nonatomic, strong) KTGridItem *grideItem;

@end

NS_ASSUME_NONNULL_END
