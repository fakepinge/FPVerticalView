/*******************************************************************************
 # File        : FPVerticalView.m
 # Project     : FPVerticalView
 # Author      : fakepinge
 # Created     : 2017/12/16
 # Corporation : fakepinge
 # Description :
 xxx
 -------------------------------------------------------------------------------
 # Date        : 2017/12/16
 # Author      : fakepinge
 # Notes       :
 xxx
 ******************************************************************************/

#import "FPVerticalView.h"
#import <Masonry/Masonry.h>

@interface FPVerticalView ()<UIScrollViewDelegate>

/**滚动View*/
@property (nonatomic, strong) UIScrollView *scrollView;
/**背景View*/
@property (nonatomic, strong) UIView *contentView;
/**视图数组*/
@property (nonatomic, strong) NSMutableArray <UIView *> *arrViews;

@end

@implementation FPVerticalView

#pragma mark ----------------------------- 生命周期 ------------------------------
#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化默认数据
        [self createDefaultData];
        // 初始化界面
        [self createUI];
        // 布局界面
        [self createConstraints];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"=======%@被销毁了======", [self class]);
}

#pragma mark  初始化默认数据
- (void)createDefaultData {
    _arrViews = [NSMutableArray array];
    _topMargin = 0;
    _bottomMargin = 0;
    _verMargin = 0;
}

#pragma mark  初始化界面
- (void)createUI {
    // scrollView
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.backgroundColor = [UIColor clearColor];
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.scrollEnabled = YES;
    _scrollView.delegate = self;
    [self addSubview:_scrollView];
    // contentView
    _contentView = [[UIView alloc] init];
    _contentView.backgroundColor = [UIColor clearColor];
    [_scrollView addSubview:_contentView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (!scrollView.bounces) return;
    if (!_topCloseBounces) return;
    if (scrollView.contentOffset.y < 0) {
        scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, 0);
    }
}

#pragma mark  布局界面
- (void)createConstraints {
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_scrollView);
        make.width.mas_equalTo(_scrollView.mas_width);
        make.height.mas_equalTo(_scrollView.mas_height).priority(250);
    }];
    [_contentView.superview setNeedsLayout];
    [_contentView.superview layoutIfNeeded];
    [_scrollView.superview setNeedsLayout];
    [_scrollView.superview layoutIfNeeded];
}

#pragma mark - 加载布局
- (void)loadLayoutSubview {
    if (_arrViews == nil || _arrViews.count == 0) {
        return;
    }
    UIView *lastView = nil;
    for (int i = 0; i < _arrViews.count; i++) {
        UIView *tempView = _arrViews[i];
        CGFloat width = tempView.frame.size.width;
        CGFloat height = tempView.frame.size.height;
        // 布局
        [tempView mas_updateConstraints:^(MASConstraintMaker *make) {
            if (tempView.hidden && i != _arrViews.count - 1) { // 不是最后一个隐藏
                // 不对这个View布局
            } else if (tempView.hidden && i == _arrViews.count - 1) {
                // 不对最后一个布局
                // 并且让上一个不隐藏的View的bottom针对父视图布局
                [lastView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.bottom.equalTo(_contentView).offset(-_bottomMargin);
                }];
            } else { // 正常情况
                if (lastView) {
                    make.left.equalTo(_contentView);
                    make.top.mas_equalTo(lastView.mas_bottom).offset(tempView.verMargin);
                    if (i == _arrViews.count - 1) { // 最后一个
                        make.bottom.equalTo(_contentView).offset(-_bottomMargin);
                    }
                } else { // 第一个
                    make.top.equalTo(_contentView).offset(_topMargin);
                    make.left.equalTo(_contentView);
                }
            }
            if (!tempView.isMasonry) {
                make.width.mas_equalTo(width);
                make.height.mas_equalTo(height);
            }
        }];
        if (tempView.hidden && i != _arrViews.count - 1) { // 不是最后一个隐藏
            // 不对这个View记录
        } else {
            lastView = tempView;
        }
    }
    [self setNeedsLayout];
    [self layoutIfNeeded];
    [_arrViews enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.initialHeight = obj.frame.size.height;
        obj.initialWidth = obj.frame.size.width;
    }];
}

#pragma mark ----------------------------- 其他方法 ------------------------------
#pragma mark - 刷新布局
- (void)refreshLayoutSubview {
    if (_arrViews == nil || _arrViews.count == 0) {
        return;
    }
    UIView *lastView = nil;
    for (int i = 0; i < _arrViews.count; i++) {
        UIView *tempView = _arrViews[i];
        CGFloat width = tempView.initialWidth;
        CGFloat height = tempView.initialHeight;
        // 布局
        // 移除View上所有的约束
        if (!tempView.isMasonry) {
            [tempView mas_remakeConstraints:^(MASConstraintMaker *make) {
                if (_contentView) {
                    if (lastView) {
                        make.left.equalTo(_contentView);
                        make.top.mas_equalTo(lastView.mas_bottom).offset(tempView.hidden ? 0 : tempView.verMargin);
                        if (i == _arrViews.count - 1) { // 最后一个
                            make.bottom.equalTo(_contentView).offset(-_bottomMargin);
                        }
                    } else { // 第一个
                        make.top.equalTo(_contentView).offset(_topMargin);
                        make.left.equalTo(_contentView);
                    }
                    make.width.mas_equalTo(width);
                    make.height.mas_equalTo(tempView.hidden ? 0 : height);
                }
            }];
        } else {
            [tempView mas_updateConstraints:^(MASConstraintMaker *make) {
                if (_contentView) {
                    if (lastView) {
                        make.left.equalTo(_contentView);
                        make.top.mas_equalTo(lastView.mas_bottom).offset(tempView.hidden ? 0 : tempView.verMargin);
                        if (i == _arrViews.count - 1) { // 最后一个
                            make.bottom.equalTo(_contentView).offset(-_bottomMargin);
                        }
                    } else { // 第一个
                        make.top.equalTo(_contentView).offset(_topMargin);
                        make.left.equalTo(_contentView);
                    }
                    if ((width == 0 && height == 0)) {
                        
                    } else {
                        make.width.mas_equalTo(width);
                        make.height.mas_equalTo(tempView.hidden ? 0 : height);
                    }
                }
            }];
        }
        [tempView.superview setNeedsUpdateConstraints];
        [tempView.superview updateConstraintsIfNeeded];
        [tempView.superview setNeedsLayout];
        [tempView.superview layoutIfNeeded];
        lastView = tempView;
    }
}

#pragma mark  是否已经存在
- (BOOL)isHasExistWithView:(UIView *)view {
    BOOL isExist = NO;
    isExist = [_arrViews containsObject:view];
    return isExist;
}

#pragma mark 获取View所处数组中的下标
- (NSUInteger)getIndexWithView:(UIView *)view {
    NSUInteger currentIndex = 0;
    if (![self isHasExistWithView:view]) {
        currentIndex = _arrViews.count;
        return currentIndex;
    }
    // 存在
    currentIndex = [_arrViews indexOfObject:view];
    return currentIndex;
}

#pragma mark 添加view冰负责包装view、绑定监听对象
- (void)contentViewAddSubView:(UIView *)view {
    if (!view) {
        return;
    }
    [_contentView addSubview:view];
    __weak typeof(self) weakSelf = self;
    view.hiddenObserver = [FPObserver observerForObject:view keyPath:@"hidden" oldAndNewBlock:^(id  _Nonnull object, id  _Nonnull oldValue, id  _Nonnull newValue) {
        [weakSelf refreshLayoutSubview];
    }];
    
    view.frameObserver = [FPObserver observerForObject:view keyPath:@"frame" oldAndNewBlock:^(id  _Nonnull object, id  _Nonnull oldValue, id  _Nonnull newValue) {
        UIView *view = (UIView *)object;
        view.initialWidth = view.frame.size.width;
        view.initialHeight = view.frame.size.height;
        [weakSelf refreshLayoutSubview];
    }];
    if (!view.hasSpecialMargin) { // 单独设置了间距就是用自己的特定的间距
        view.verMargin = _verMargin;
    }
}

#pragma mark ----------------------------- 公有方法 ------------------------------
#pragma mark - 添加子视图数组
- (void)addSubviewArray:(NSArray<UIView *> *)subviewArray {
    // 多次添加 移除前面的
    if (_arrViews && _arrViews.count > 0) {
        [_arrViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [_arrViews removeAllObjects];
    }
    [_arrViews addObjectsFromArray:subviewArray];
    __weak typeof(self) weakSelf = self;;
    [_arrViews enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [weakSelf contentViewAddSubView:obj];
    }];
    [self loadLayoutSubview];
}

#pragma mark - 添加view时刷新布局
- (void)setRefreshLayoutWithView:(UIView *)view {
    if (!view.isMasonry) {
        view.initialWidth = view.frame.size.width;
        view.initialHeight = view.frame.size.height;
    }
    [self refreshLayoutSubview];
    view.initialWidth = view.frame.size.width;
    view.initialHeight = view.frame.size.height;
}

#pragma mark - 添加view到最顶部
- (void)addSubviewToTop:(UIView *)view {
    [self contentViewAddSubView:view];
    [_arrViews insertObject:view atIndex:0];
    [self setRefreshLayoutWithView:view];
}

#pragma mark - 添加view到最底部
- (void)addSubviewToBottom:(UIView *)view {
    [self contentViewAddSubView:view];
    [_arrViews addObject:view];
    [self setRefreshLayoutWithView:view];
}

#pragma mark - 添加view到bottomView的下面
- (void)addSubview:(UIView *)view toBottomView:(UIView *)bottomView {
    if (!view || !bottomView) {
        return;
    }
    if ([self isHasExistWithView:view]) {
        return;
    }
    [self contentViewAddSubView:view];
    NSUInteger currentIndex = [self getIndexWithView:bottomView];
    if ([self isHasExistWithView:bottomView]) {
        [_arrViews insertObject:view atIndex:currentIndex + 1];
    } else {
        [_arrViews addObject:view];
    }
    [self setRefreshLayoutWithView:view];
}

#pragma mark - 添加view到frontView的上面
- (void)addSubview:(UIView *)view toFrontView:(UIView *)frontView {
    if (!view || !frontView) {
        return;
    }
    if ([self isHasExistWithView:view]) {
        return;
    }
    [self contentViewAddSubView:view];
    NSUInteger currentIndex = [self getIndexWithView:frontView];
    if ([self isHasExistWithView:frontView]) {
        [_arrViews insertObject:view atIndex:currentIndex];
    } else {
        [_arrViews addObject:view];
    }
    [self setRefreshLayoutWithView:view];
}

#pragma mark --------------------------- setter&getter -------------------------
- (void)setScrollEnabled:(BOOL)scrollEnabled {
    _scrollEnabled = scrollEnabled;
    _scrollView.scrollEnabled = _scrollEnabled;
}

-(void)setBounces:(BOOL)bounces {
    _scrollView.bounces = bounces;
}

- (void)setTopMargin:(CGFloat)topMargin {
    _topMargin = topMargin;
    [self refreshLayoutSubview];
}

- (void)setBottomMargin:(CGFloat)bottomMargin {
    _bottomMargin = bottomMargin;
    [self refreshLayoutSubview];
}

- (void)setVerMargin:(CGFloat)verMargin {
    _verMargin = verMargin;
    [[self subVerticalViews] enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (!obj.hasSpecialMargin) { // 单独设置了间距就是用自己的特定的间距
            obj.verMargin = verMargin;
        }
    }];
    [self refreshLayoutSubview];
}

-(NSArray<UIView *> *)subVerticalViews{
    return _arrViews;
}

@end
