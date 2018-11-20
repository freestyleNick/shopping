//
//  KTNewWelfareCell.h
//  shopping
//
//  Created by nike on 2018/11/16.
//  Copyright © 2018 nike. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^OneCellBlcok)(NSInteger indexpath);

@interface KTNewWelfareCell : UICollectionViewCell

/** onecell传值 */
@property (nonatomic, copy) OneCellBlcok oneCellBlock;

@end

NS_ASSUME_NONNULL_END
