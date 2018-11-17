//
//  KTNewWelfareLayout.m
//  shopping
//
//  Created by nike on 2018/11/16.
//  Copyright © 2018 nike. All rights reserved.
//

#import "KTNewWelfareLayout.h"

@interface KTNewWelfareLayout()

/** 整体高度 */
@property (nonatomic, assign) CGFloat overallHeight;
/** 布局数组 */
@property (nonatomic, strong) NSMutableArray *attarArray;

@end

@implementation KTNewWelfareLayout

/**
 1.一个Cell对应一个UICollectionViewLayoutAttributes对象
 2.UICollectionViewLayoutAttributes对象决定了cell的摆设位置（frame）
 */
#pragma mark - 初始化layout的结构和初始需要的参数
- (void)prepareLayout
{
    [super prepareLayout];
    
    self.overallHeight = 0; //初始Height
    
    [self setUpAttributes]; //初始化属性
}

#pragma mark - 初始化属性（section/item）
- (void)setUpAttributes
{
    NSMutableArray *attributesArray = [NSMutableArray array];
    NSInteger sectionCount = [self.collectionView numberOfSections];
    for (int i = 0; i < sectionCount; i++) { //遍历
        //sectionHeader
        NSIndexPath *indexPath = [NSIndexPath indexPathWithIndex:i];
        UICollectionViewLayoutAttributes *attrheader = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:indexPath];
        [attributesArray addObject:attrheader];
        
        //sectionItem
        NSInteger itemCount = [self.collectionView numberOfItemsInSection:i];
        for (int j = 0; j < itemCount; j++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:j inSection:i];
            UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
            [attributesArray addObject:attrs];
        }
        //sectionfooter
        UICollectionViewLayoutAttributes *attrFooter = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter atIndexPath:indexPath];
        [attributesArray addObject:attrFooter];
    }
    
    self.attarArray = [NSMutableArray arrayWithArray:attributesArray];
}

-(CGSize)collectionViewContentSize {
    return CGSizeMake(self.collectionView.bounds.size.width, self.overallHeight);
}

#pragma mark - 对应indexPath的位置的追加视图的布局属性
-(UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    
    
    UICollectionViewLayoutAttributes *layoutAttrbutes = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:elementKind withIndexPath:indexPath];
    CGFloat height = 0;
    
    if (elementKind == UICollectionElementKindSectionHeader) { //头部
        if (_delegate != nil && [_delegate respondsToSelector:@selector(kt_HeightOfSectionHeaderForIndexPath:)]) {
            height = [_delegate kt_HeightOfSectionHeaderForIndexPath:indexPath];
        }
    } else { //尾部
        if (_delegate != nil && [_delegate respondsToSelector:@selector(kt_HeightOfSectionFooterForIndexPath:)]) {
            height = [_delegate kt_HeightOfSectionFooterForIndexPath:indexPath];
        }
    }
    layoutAttrbutes.frame = CGRectMake(0, self.overallHeight, ScreenW, height);
    
    self.overallHeight += height;
    
    return layoutAttrbutes;
}

#pragma mark - 返回rect中的所有的元素的布局属性
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return self.attarArray;
}


#pragma mark - 返回对应于indexPath的位置的cell的布局属性
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    switch (indexPath.section) {
        case 0:
            [self layoutAttributesForCustomOneLayout:layoutAttributes indexPath:indexPath];
            break;
            
        default:
            break;
    }
    return layoutAttributes;
}



#pragma mark - 自定义第一组section
- (void)layoutAttributesForCustomOneLayout:(UICollectionViewLayoutAttributes *)layoutAttributes indexPath: (NSIndexPath *) indexPath {
    
    if (indexPath.item > 3)return;
    CGFloat itemY = self.overallHeight;
    
    CGFloat itemH = 85;
    CGFloat itemW = ScreenW / 2.0;
    switch (indexPath.item) {
        case 0:
            layoutAttributes.frame = CGRectMake(0, itemY, itemW, itemH);
            break;
        case 1:
            layoutAttributes.frame = CGRectMake(itemW, itemY, itemW, itemH);
            break;
        case 2:
            self.overallHeight += itemH;
            layoutAttributes.frame = CGRectMake(0, itemH, ScreenW, itemH);
            self.overallHeight += itemH;
            break;
        default:
            break;
    }
}

@end
