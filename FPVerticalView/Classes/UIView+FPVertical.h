//
//  UIView+FPVertical.h
//  FPVerticalView_Example
//
//  Created by fakepinge on 2017/12/16.
//  Copyright © 2017年 fakepinge@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APPObserver.h"

@interface UIView (FPVertical)

@property (nonatomic, assign) BOOL isMasonry;

@property (nonatomic, assign) CGFloat initialHeight;

@property (nonatomic, assign) CGFloat initialWidth;
// 是否使用特殊的间距
@property (nonatomic, assign) BOOL isSpecialHasMargin;
// 距离上一个view的间距
@property (nonatomic, assign) CGFloat verMargin;

@property (nonatomic, strong) APPObserver *hiddenObserver;

@property (nonatomic, strong) APPObserver *frameObserver;

@end
