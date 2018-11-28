//
//  KTStateItem.h
//  shopping
//
//  Created by nike on 2018/11/28.
//  Copyright © 2018 nike. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KTStateItem : NSObject
/* 显示文字图片 */
@property (nonatomic, assign) BOOL showImage;

/* 图片或数字 */
@property (nonatomic, copy) NSString *imageContent;

/* 标题 */
@property (nonatomic, copy) NSString *stateTitle;

/* 背景色 */
@property (nonatomic, assign) BOOL bgColor;

@end

NS_ASSUME_NONNULL_END
