//
//  KTStateItemCell.h
//  shopping
//
//  Created by nike on 2018/11/28.
//  Copyright © 2018 nike. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class KTStateItem;

@interface KTStateItemCell : UICollectionViewCell

/** 模型数据 */
@property (nonatomic, strong) KTStateItem *stateItem;


@end

NS_ASSUME_NONNULL_END
