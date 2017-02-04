//
//  XJYPhotoPreview.h
//  高仿萝卜书摘
//
//  Created by 谢俊逸 on 30/12/2016.
//  Copyright © 2016 谢俊逸. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol XJYPhotoPreviewDelegate <NSObject>

/**
 删除图片

 @param idx 图片的idx
 */
- (void)photoPreviewRemoveImageItemAtIdx:(NSUInteger)idx;
/**
 点击图片
 
 @param idx 图片的idx
 */
- (void)photoPreviewTapImageItemAtIdx:(NSUInteger)idx;

@end

@interface XJYPhotoPreview : UICollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewItemSize:(CGSize)itemSize withImageArr:(NSMutableArray<UIImage *> *)imagerArr;



@property (nonatomic, weak) id<XJYPhotoPreviewDelegate> photoPreviewDelegate;

@property (nonatomic, strong) NSMutableArray<UIImage *> *ImageArray;


@end
