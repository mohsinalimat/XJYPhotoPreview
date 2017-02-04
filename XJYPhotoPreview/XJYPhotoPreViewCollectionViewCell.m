//
//  XJYPhotoPreViewCollectionViewCell.m
//  RecordLife
//
//  Created by 谢俊逸 on 04/02/2017.
//  Copyright © 2017 谢俊逸. All rights reserved.
//

#import "XJYPhotoPreViewCollectionViewCell.h"
#import "XJYPhotoPreview.h"

@interface XJYPhotoPreViewCollectionViewCell ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *deleteButton;

@end

@implementation XJYPhotoPreViewCollectionViewCell



- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.imageView];
        [self.imageView addSubview:self.deleteButton];
        
    }
    return self;
}


#pragma mark Auto Layout

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (void)updateConstraints {
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
        make.right.equalTo(self.mas_right);
        make.left.equalTo(self.mas_left);
    }];
    [_deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_top).offset(5);
        make.right.equalTo(self.imageView.mas_right).offset(-5);
        make.width.height.equalTo(@25);
    }];
    [super updateConstraints];
}


#pragma mark Getter 

- (UIButton *)deleteButton {
    if(!_deleteButton) {
        _deleteButton = [[UIButton alloc] init];
        [_deleteButton setImage:[UIImage imageNamed:@"delete.png"] forState:UIControlStateNormal];
        [_deleteButton addTarget:self action:@selector(deleteButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteButton;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.userInteractionEnabled = YES;
    }
    return _imageView;
}

#pragma mark Setter 

- (void)setImage:(UIImage *)image {
    _image = image;
    self.imageView.image = image;
}

#pragma mark Actions

- (void)deleteButtonClicked:(UIButton *)button {
    
    XJYPhotoPreview *photoView =(XJYPhotoPreview *)self.superview;
    NSIndexPath *indexPath = [photoView indexPathForCell:self];
    
    self.deleteImageBlock(indexPath.item);
    
}

@end
