//
//  KTNewWelfareLayout.h
//  shopping
//
//  Created by nike on 2018/11/16.
//  Copyright © 2018 nike. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol KTNewWelfareLayoutDelegate <NSObject>

@required;
/** 头部高度 */
- (CGFloat)kt_HeightOfSectionHeaderForIndexPath:(NSIndexPath *)indexPath;
/* 尾部高度 */
- (CGFloat)kt_HeightOfSectionFooterForIndexPath:(NSIndexPath *)indexPath;


@end

@interface KTNewWelfareLayout : UICollectionViewFlowLayout

/** 代理 */
@property (nonatomic, assign) id<KTNewWelfareLayoutDelegate> delegate;


@end

NS_ASSUME_NONNULL_END
