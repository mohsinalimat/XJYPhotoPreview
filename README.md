# XJYPhotoPreview

照片预览组件


![image](https://github.com/JunyiXie/XJYPhotoPreview/raw/master/photos/image1.PNG)


使用方法:
Example 
```objectivec

1. 遵守协议<XJYPhotoPreviewDelegate>

2. self.photoPreview = [[XJYPhotoPreview alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewItemSize:CGSizeMake(ItemW, ItemH) withImageArr:self.viewModel.imageArray];

3.
协议:
#pragma mark XJYPhotoPreviewDelegate 

- (void)photoPreviewRemoveImageItemAtIdx:(NSUInteger)idx {
[self.viewModel.imageArray removeObjectAtIndex:idx];
}

- (void)photoPreviewTapImageItemAtIdx:(NSUInteger)idx {

}

```



遵循的协议
```objectivec

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

```
