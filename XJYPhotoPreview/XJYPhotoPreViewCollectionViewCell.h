//
//  XJYPhotoPreViewCollectionViewCell.h
//  RecordLife
//
//  Created by 谢俊逸 on 04/02/2017.
//  Copyright © 2017 谢俊逸. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
static  NSString *kCellID = @"XJYPhotoPreViewCollectionViewCell";

@interface XJYPhotoPreViewCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIImage *image;

@property (nonatomic, copy) void (^deleteImageBlock)(NSUInteger idx);

@end
