//
//  JApisButton.h
//  XiaoShe
//
//  Created by ChenFeng on 15/3/24.
//  Copyright (c) 2015年 Ingenic. All rights reserved.
//

#import <UIKit/UIKit.h>
 
//xib   动态刷新  
IB_DESIGNABLE
@interface JApisButton : UIButton

//self.imageView强制是方形的，按比例取self长宽的最小值
@property (nonatomic, assign) IBInspectable CGFloat imageRatio;

//self.imageView强制是方形的，按比例取self长宽的最小值
@property (nonatomic, assign) IBInspectable CGFloat cornerRadiusNum;

//self.imageView与self.titleLabel垂直间距
@property (nonatomic, assign) IBInspectable CGFloat spaceWithImageAndTitle;

//self.imageView 位置  0 顶部  1 左侧  2 底部  3右侧
@property (nonatomic, assign) IBInspectable NSInteger imageLocation;

//self.imageView  距离边框 位置  只有  ButtonLeft   ButtonRight  有效
@property (nonatomic, assign) IBInspectable CGFloat leftRight;

@end
