//
//  KTRecommendItem.h
//  shopping
//
//  Created by nike on 2018/11/13.
//  Copyright © 2018 nike. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KTRecommendItem : NSObject
/** 图片URL */
@property (nonatomic, copy ,readonly) NSString *image_url;
/** 商品标题 */
@property (nonatomic, copy ,readonly) NSString *main_title;
/** 商品小标题 */
@property (nonatomic, copy ,readonly) NSString *goods_title;
/** 商品价格 */
@property (nonatomic, copy ,readonly) NSString *price;
/** 剩余 */
@property (nonatomic, copy ,readonly) NSString *stock;
/** 属性 */
@property (nonatomic, copy ,readonly) NSString *nature;

/* 头部轮播 */
@property (copy , nonatomic , readonly)NSArray *images;

@end

NS_ASSUME_NONNULL_END
