//
//  KTCenterServiceCell.h
//  shopping
//
//  Created by nike on 2018/11/29.
//  Copyright © 2018 nike. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class KTGridItem;

@interface KTCenterServiceCell : UITableViewCell

/** 数据 */
@property (nonatomic, strong) NSMutableArray <KTGridItem *> *serviceItemArray;


@end

NS_ASSUME_NONNULL_END
