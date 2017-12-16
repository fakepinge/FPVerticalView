//
//  APPObserver.h
//  FPVerticalView_Example
//
//  Created by fakepinge on 2017/12/16.
//  Copyright © 2017年 fakepinge@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^APPObserverBlock)(id object);
typedef void(^APPObserverOldAndNewBlock)(id object,id oldValue, id newValue);

@interface APPObserver : NSObject

+ (id)observerForObject:(id)object keyPath:(NSString *)keyPath block:(APPObserverBlock)block;

+ (id)observerForObject:(id)object keyPath:(NSString *)keyPath oldAndNewBlock:(APPObserverOldAndNewBlock)block;

- (void)stopObserving;

@end

NS_ASSUME_NONNULL_END
