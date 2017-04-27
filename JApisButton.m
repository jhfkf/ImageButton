//
//  JApisButton.m
//  XiaoShe
//
//  Created by ChenFeng on 15/3/24.
//  Copyright (c) 2015年 Ingenic. All rights reserved.
//
#import "JApisButton.h"

@implementation JApisButton

- (void)setImageRatio:(CGFloat)imageRatio {
    _imageRatio = imageRatio;
    if (self.superview) {
        [self setNeedsLayout];
        [self layoutIfNeeded];
        
    }
}

- (void)setSpaceWithImageAndTitle:(CGFloat)spaceWithImageAndTitle {
    _spaceWithImageAndTitle = spaceWithImageAndTitle<0? 0:spaceWithImageAndTitle;
    if (self.superview) {
        [self setNeedsLayout];
        [self layoutIfNeeded];
    }
}



-(void)setImageLocation:(NSInteger)imageLocation{
    
    if (imageLocation < 4 && imageLocation > 0)
        _imageLocation = imageLocation;
    else
        _imageLocation = 0;
    
    if (self.superview) {
        [self setNeedsLayout];
        [self layoutIfNeeded];
    }
}


-(void)setLeftRight:(CGFloat)leftRight{
    _leftRight = leftRight;
    if (self.superview) {
        [self setNeedsLayout];
        [self layoutIfNeeded];
    }
}


-(void)setCornerRadiusNum:(CGFloat)cornerRadiusNum{
    _cornerRadiusNum = cornerRadiusNum<0? 0:cornerRadiusNum;
    if (self.superview) {
        [self setNeedsLayout];
        [self layoutIfNeeded];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat superWidth = CGRectGetWidth(self.bounds);
    CGFloat superHeight = CGRectGetHeight(self.bounds);
    CGFloat imageViewHeight = 0;
    CGFloat titleLabelHeight = 0;
    
    if(self.imageView) {
        CGFloat ratio = _imageRatio>0 && _imageRatio<=1? _imageRatio:0.5;
        imageViewHeight = MIN(superWidth, superHeight)*ratio;
        self.imageView.frame =CGRectMake(0, 0, imageViewHeight, imageViewHeight);
    }
    
    if(self.imageView && self.cornerRadiusNum > 0) {
        self.imageView.layer.cornerRadius = _cornerRadiusNum * imageViewHeight;
        self.imageView.layer.masksToBounds = YES;
    }
    
    CGSize titleLabelSize = self.titleLabel.text.length>0? [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}]:CGSizeZero;
    titleLabelHeight = titleLabelSize.height;
    self.titleLabel.frame = CGRectMake(0, 0, titleLabelSize.width, titleLabelSize.height);
    
    
    if (_imageLocation == 0) {
        self.imageView.center = CGPointMake(superWidth/2.f, superHeight/2.f-titleLabelHeight/2.f-_spaceWithImageAndTitle/2.f);
        self.titleLabel.center = CGPointMake(superWidth/2.f, superHeight/2.f+imageViewHeight/2.f+_spaceWithImageAndTitle/2.f);
    }else if (_imageLocation == 1) {
        self.imageView.center = CGPointMake(_leftRight+imageViewHeight/2.f, superHeight/2);
        self.titleLabel.center = CGPointMake(_leftRight + imageViewHeight/2 + titleLabelSize.width + _spaceWithImageAndTitle, superHeight/2);
    }else if (_imageLocation == 2) {
        self.imageView.center = CGPointMake(superWidth/2.f, superHeight/2.f+imageViewHeight/2.f+_spaceWithImageAndTitle/2.f);
        self.titleLabel.center = CGPointMake(superWidth/2.f, superHeight/2.f-titleLabelHeight/2.f-_spaceWithImageAndTitle/2.f);
    }else if (_imageLocation == 3) {
        self.imageView.center = CGPointMake(superWidth - (_leftRight+imageViewHeight/2.f), superHeight/2);
        self.titleLabel.center = CGPointMake(superWidth - (_leftRight + imageViewHeight/2 + titleLabelSize.width + _spaceWithImageAndTitle), superHeight/2);
    }
}

@end















