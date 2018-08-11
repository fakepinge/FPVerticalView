//
//  FPObserver.m
//  FPVerticalView_Example
//
//  Created by fakepinge on 2017/12/16.
//  Copyright © 2017年 fakepinge@gmail.com. All rights reserved.
//


#import "FPObserver.h"

typedef NS_ENUM(NSUInteger,FPObserverKind) {
    FPObserverKindNone = 0,
    FPObserverKindOldAndNew = 1,
};

@interface FPObserver () {
    NSString *_keyPath;
    dispatch_block_t _block;
    __unsafe_unretained id _observedObject;
}

@end

@implementation FPObserver

#pragma mark - private
- (id)initForObject:(id)object keyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options block:(dispatch_block_t)block blockArgumentsKind:(FPObserverKind)observerKind {
    if ((self = [super init])) {
        _observedObject = object;
        _keyPath = [keyPath copy];
        _block = [block copy];
        [_observedObject addObserver:self forKeyPath:_keyPath options:options context:(void *)observerKind];
    }
    return self;
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    switch ((FPObserverKind)context) {
        case FPObserverKindNone:{
            ((FPObserverBlock)_block)(object);
        }
            break;
        case FPObserverKindOldAndNew: {
            id oldValue = change[NSKeyValueChangeOldKey];
            id newValue = change[NSKeyValueChangeNewKey];
            if ([oldValue isKindOfClass:[NSNull class]]) {
                oldValue= nil;
            }
            if ([newValue isKindOfClass:[NSNull class]]) {
                newValue = nil;
            }
            ((FPObserverOldAndNewBlock)_block)(object,oldValue,newValue);
        }
            break;
        default:
            [NSException raise:NSInternalInconsistencyException format:@"FPObserver say: %s called on %@ with unrecognised context (%p)", __func__, self, context];
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
+ (id)observerForObject:(id)object keyPath:(NSString *)keyPath block:(FPObserverBlock)block {
    return [[FPObserver alloc] initForObject:object keyPath:keyPath options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld|NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionPrior block:(dispatch_block_t)block blockArgumentsKind:FPObserverKindNone];
}

+ (id)observerForObject:(id)object keyPath:(NSString *)keyPath oldAndNewBlock:(FPObserverOldAndNewBlock)block {
    return [[FPObserver alloc] initForObject:object keyPath:keyPath options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld block:(dispatch_block_t)block blockArgumentsKind:FPObserverKindOldAndNew];
}

@end
