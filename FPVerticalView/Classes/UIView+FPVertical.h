//
//  UIView+FPVertical.h
//  FPVerticalView_Example
//
//  Created by fakepinge on 2017/12/16.
//  Copyright © 2017年 fakepinge@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FPObserver.h"

@interface UIView (FPVertical)

/**本身是否使用约束布局*/
@property (nonatomic, assign) BOOL isMasonry;
/**是否自己设置间距*/
@property (nonatomic, assign) BOOL hasSpecialMargin;
/**间距*/
@property (nonatomic, assign) CGFloat verMargin;
/**hidden监听*/
@property (nonatomic, strong) FPObserver *hiddenObserver;
/**frame监听*/
@property (nonatomic, strong) FPObserver *frameObserver;
/**原始高度*/
@property (nonatomic, assign) CGFloat initialHeight;
/**原始宽度*/
@property (nonatomic, assign) CGFloat initialWidth;

@end
