//
//  FPObserver.h
//  FPVerticalView_Example
//
//  Created by fakepinge on 2017/12/16.
//  Copyright © 2017年 fakepinge@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^FPObserverBlock)(id object);
typedef void(^FPObserverOldAndNewBlock)(id object,id oldValue, id newValue);

@interface FPObserver : NSObject

+ (id)observerForObject:(id)object keyPath:(NSString *)keyPath block:(FPObserverBlock)block;

+ (id)observerForObject:(id)object keyPath:(NSString *)keyPath oldAndNewBlock:(FPObserverOldAndNewBlock)block;

- (void)stopObserving;

@end

NS_ASSUME_NONNULL_END
