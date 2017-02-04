//
//  XJYPhotoPreview.m
//  高仿萝卜书摘
//
//  Created by 谢俊逸 on 30/12/2016.
//  Copyright © 2016 谢俊逸. All rights reserved.
//

#import "XJYPhotoPreview.h"
#import "XJYPhotoPreViewCollectionViewCell.h"


@interface XJYPhotoPreview ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource,UIImagePickerControllerDelegate>

@property (nonatomic, strong) UICollectionViewFlowLayout *layout;
@property (nonatomic, assign) CGSize ItemSize;


@end

@implementation XJYPhotoPreview

- (instancetype)initWithFrame:(CGRect)frame collectionViewItemSize:(CGSize)itemSize withImageArr:(NSMutableArray<UIImage *> *)imagerArr {
    _ItemSize = itemSize;
    if (self = [super initWithFrame:frame collectionViewLayout:self.layout]) {
        //        [self setLayout:self.layout];
        
        if ([imagerArr isKindOfClass:[NSArray class]]) {
            _ImageArray = [NSMutableArray arrayWithArray:imagerArr];
        } else {
            _ImageArray = imagerArr;
        }
        self.bounces = NO;
        self.pagingEnabled = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.delegate = self;
        self.dataSource = self;
        self.showsHorizontalScrollIndicator = YES;
        self.backgroundColor = [UIColor whiteColor];
        [self registerClass:[XJYPhotoPreViewCollectionViewCell class] forCellWithReuseIdentifier:kCellID];
    }
    return self;
}

- (UICollectionViewLayout *)layout {
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.itemSize = _ItemSize;
        _layout.minimumLineSpacing = 10.0;
        _layout.minimumInteritemSpacing = 0.0;
        _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    }
    return _layout;
}

#pragma mark UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSLog(@"%lu",(unsigned long)self.ImageArray.count);
    return self.ImageArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XJYPhotoPreViewCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellID forIndexPath:indexPath];
    cell.image = self.ImageArray[indexPath.item];
    cell.deleteImageBlock = ^(NSUInteger idx){
        
        //移除
        [self.ImageArray removeObjectAtIndex:idx];
        //委托执行
        if ([self.photoPreviewDelegate respondsToSelector:@selector(photoPreviewRemoveImageItemAtIdx:)]) {
            [self.photoPreviewDelegate photoPreviewRemoveImageItemAtIdx:idx];

        }
        //更新视图
        dispatch_async(dispatch_get_main_queue(), ^{
            [self reloadData];
        });
    };
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.photoPreviewDelegate respondsToSelector:@selector(photoPreviewTapImageItemAtIdx:)]) {
        [self.photoPreviewDelegate photoPreviewTapImageItemAtIdx:indexPath.item];
    }
}


#pragma mark UICollectionViewDelegate



#pragma mark PublicMethods

- (void)addItem:(UIImage *)image {
    [self.ImageArray addObject:image];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self reloadData];
    });
}



@end
