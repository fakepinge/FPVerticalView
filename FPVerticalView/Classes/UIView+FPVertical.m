//
//  UIView+FPVertical.m
//  FPVerticalView_Example
//
//  Created by fakepinge on 2017/12/16.
//  Copyright © 2017年 fakepinge@gmail.com. All rights reserved.
//

#import "UIView+FPVertical.h"
#import <objc/runtime.h>

const void * FPHiddenObserverAddr = "hidden_observer_addr";
const void * FPFrameObserverAddr = "frame_observer_addr";

@implementation UIView (FPVertical)

- (BOOL)isMasonry {
    return [objc_getAssociatedObject(self, @selector(isMasonry)) boolValue];
}

- (void)setIsMasonry:(BOOL)isMasonry {
    objc_setAssociatedObject(self, @selector(isMasonry), @(isMasonry), OBJC_ASSOCIATION_RETAIN);
}

- (BOOL)hasSpecialMargin {
    return [objc_getAssociatedObject(self, @selector(hasSpecialMargin)) boolValue];
}

- (void)setHasSpecialMargin:(BOOL)isSpecialHasMargin {
    objc_setAssociatedObject(self, @selector(hasSpecialMargin), @(isSpecialHasMargin), OBJC_ASSOCIATION_RETAIN);
}

- (CGFloat)verMargin {
    return [objc_getAssociatedObject(self, @selector(verMargin)) floatValue];
}

- (void)setVerMargin:(CGFloat)verMargin{
    objc_setAssociatedObject(self, @selector(verMargin), @(verMargin), OBJC_ASSOCIATION_RETAIN);
}

- (void)setFrameObserver:(FPObserver *)frameObserver {
    objc_setAssociatedObject(self, FPFrameObserverAddr, frameObserver, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setHiddenObserver:(FPObserver *)hiddenObserver {
    objc_setAssociatedObject(self, FPHiddenObserverAddr, hiddenObserver, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (FPObserver *)frameObserver {
    return objc_getAssociatedObject(self, FPFrameObserverAddr);
}

- (FPObserver *)hiddenObserver {
    return objc_getAssociatedObject(self, FPHiddenObserverAddr);
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

@end
