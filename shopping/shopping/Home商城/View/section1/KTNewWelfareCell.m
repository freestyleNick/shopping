//
//  KTNewWelfareCell.m
//  shopping
//
//  Created by nike on 2018/11/16.
//  Copyright © 2018 nike. All rights reserved.
//

#import "KTNewWelfareCell.h"
#import "KTNewWelfareLayout.h"

@interface KTNewWelfareCell ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, KTNewWelfareLayoutDelegate>

/** collectionView */
@property (nonatomic, strong) UICollectionView *collectionView;


@end

@implementation KTNewWelfareCell

//- (UICollectionView *)collectionView {
//    if (!_collectionView) {
//        KTNewWelfareLayout *layout = [[KTNewWelfareLayout alloc] init];
//        layout.delegate = self;
//        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
//        _collectionView.frame = self.bounds;
//        _collectionView.delegate = self;
//        _collectionView.dataSource = self;
//        [self addSubview:_collectionView];
//        
//    }
//    return _collectionView;
//}

@end
