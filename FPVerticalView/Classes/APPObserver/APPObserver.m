//
//  APPObserver.m
//  FPVerticalView_Example
//
//  Created by fakepinge on 2017/12/16.
//  Copyright © 2017年 fakepinge@gmail.com. All rights reserved.
//


#import "APPObserver.h"

typedef NS_ENUM(NSUInteger,APPObserverKind) {
    APPObserverKindNone = 0,
    APPObserverKindOldAndNew = 1,
};

@interface APPObserver () {
    NSString *_keyPath;
    dispatch_block_t _block;
    __unsafe_unretained id _observedObject;
}

@end

@implementation APPObserver

#pragma mark - private
- (id)initForObject:(id)object keyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options block:(dispatch_block_t)block blockArgumentsKind:(APPObserverKind)observerKind {
    if ((self = [super init])) {
        _observedObject = object;
        _keyPath = [keyPath copy];
        _block = [block copy];
        [_observedObject addObserver:self forKeyPath:_keyPath options:options context:(void *)observerKind];
    }
    return self;
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    switch ((APPObserverKind)context) {
        case APPObserverKindNone:{
            ((APPObserverBlock)_block)(object);
        }
            break;
        case APPObserverKindOldAndNew: {
            id oldValue = change[NSKeyValueChangeOldKey];
            id newValue = change[NSKeyValueChangeNewKey];
            if ([oldValue isKindOfClass:[NSNull class]]) {
                oldValue= nil;
            }
            if ([newValue isKindOfClass:[NSNull class]]) {
                newValue = nil;
            }
            ((APPObserverOldAndNewBlock)_block)(object,oldValue,newValue);
        }
            break;
        default:
            [NSException raise:NSInternalInconsistencyException format:@"APPObserver say: %s called on %@ with unrecognised context (%p)", __func__, self, context];
    }
}

- (void)dealloc {
    if(_observedObject) {
        [self stopObserving];
    }
}

- (void)stopObserving {
    [_observedObject removeObserver:self forKeyPath:_keyPath];
    _block = nil;
    _keyPath = nil;
    _observedObject = nil;
}

#pragma mark - 对外接口
+ (id)observerForObject:(id)object keyPath:(NSString *)keyPath block:(APPObserverBlock)block {
    return [[APPObserver alloc] initForObject:object keyPath:keyPath options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld|NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionPrior block:(dispatch_block_t)block blockArgumentsKind:APPObserverKindNone];
}

+ (id)observerForObject:(id)object keyPath:(NSString *)keyPath oldAndNewBlock:(APPObserverOldAndNewBlock)block {
    return [[APPObserver alloc] initForObject:object keyPath:keyPath options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld block:(dispatch_block_t)block blockArgumentsKind:APPObserverKindOldAndNew];
}

@end
