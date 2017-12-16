//
//  UIView+FPVertical.m
//  FPVerticalView_Example
//
//  Created by fakepinge on 2017/12/16.
//  Copyright © 2017年 fakepinge@gmail.com. All rights reserved.
//

#import "UIView+FPVertical.h"
#import <objc/runtime.h>

const void * kHiddenObserverAddr = "hidden_observer_addr";
const void * kFrameObserverAddr = "frame_observer_addr";

@implementation UIView (FPVertical)

- (BOOL)isMasonry {
    return [objc_getAssociatedObject(self, @selector(isMasonry)) boolValue];
}

- (void)setIsMasonry:(BOOL)isMasonry {
    objc_setAssociatedObject(self, @selector(isMasonry), @(isMasonry), OBJC_ASSOCIATION_RETAIN);
}

- (CGFloat)initialHeight {
    return [objc_getAssociatedObject(self, @selector(initialHeight)) floatValue];
}

- (void)setInitialHeight:(CGFloat)initialHeight {
    objc_setAssociatedObject(self, @selector(initialHeight), @(initialHeight), OBJC_ASSOCIATION_RETAIN);
}

- (CGFloat)initialWidth {
    return [objc_getAssociatedObject(self, @selector(initialWidth)) floatValue];
}

- (void)setInitialWidth:(CGFloat)initialWidth {
    objc_setAssociatedObject(self, @selector(initialWidth), @(initialWidth), OBJC_ASSOCIATION_RETAIN);
}

- (BOOL)isSpecialHasMargin {
    return [objc_getAssociatedObject(self, @selector(isSpecialHasMargin)) boolValue];
}

- (void)setIsSpecialHasMargin:(BOOL)isSpecialHasMargin {
    objc_setAssociatedObject(self, @selector(isSpecialHasMargin), @(isSpecialHasMargin), OBJC_ASSOCIATION_RETAIN);
}

- (CGFloat)verMargin {
    return [objc_getAssociatedObject(self, @selector(verMargin)) floatValue];
}

- (void)setVerMargin:(CGFloat)verMargin{
    objc_setAssociatedObject(self, @selector(verMargin), @(verMargin), OBJC_ASSOCIATION_RETAIN);
}

- (void)setFrameObserver:(APPObserver *)frameObserver {
    objc_setAssociatedObject(self, kFrameObserverAddr, frameObserver, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setHiddenObserver:(APPObserver *)hiddenObserver {
    objc_setAssociatedObject(self, kHiddenObserverAddr, hiddenObserver, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (APPObserver *)frameObserver {
    return objc_getAssociatedObject(self, kFrameObserverAddr);
}

- (APPObserver *)hiddenObserver {
    return objc_getAssociatedObject(self, kHiddenObserverAddr);
}

@end
