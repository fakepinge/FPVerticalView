/*******************************************************************************
 # File        : FPVerticalView.h
 # Project     : FPVerticalView
 # Author      : fakepinge
 # Created     : 2017/12/16
 # Corporation : XXX
 # Description :
 xxx
 -------------------------------------------------------------------------------
 # Date        : 2017/12/16
 # Author      : fakepinge
 # Notes       :
 xxx
 ******************************************************************************/

#import <UIKit/UIKit.h>
#import "UIView+FPVertical.h"

/** 使用注意事项
 * 1.subVerticalViews 需要布局View数组
 * 有一些View一开始需要添加进来但是需要隐藏 隐藏的设置需要在addSubviewArray调用后再设置隐藏属性 如下:
 FPVerticalView *verticaView = [[FPVerticalView alloc] initWithFrame:self.view.bounds];
 verticaView = 10;
 verticaView = 10;
 verticaView = 20;
 [verticaView addSubviewArray:[self createView]];
 view1.hidden = YES;
 view3.hidden = YES;
 [self.view addSubview:verticaView];
 2.Masonry布局的View 需要设置isMasonry属性为YES view1.isMasonry = YES;
 仅仅只是针对这个view的布局,跟子视图无关;
 3.Masonry布局的View 更新高度 宽度之类的约束 需要用 mas_updateConstraints 这个方法
 4.不建议Frame Mansonry 两种布局混用
 5.混用时 子视图通过[verticaView addSubviewArray:[self createView]]数组形式添加
 6.不建议addSubviewToTop等API一个一个的添加子视图 最好以数组的形式进行添加子视图
 */

@interface FPVerticalView : UIView

/**上边缘，默认0*/
@property (nonatomic, assign) CGFloat topMargin;
/**下边缘，默认0*/
@property (nonatomic, assign) CGFloat bottomMargin;
/**垂直间隙，默认0*/
@property (nonatomic, assign) CGFloat verMargin;
/**是否能滚动*/
@property (nonatomic, assign) BOOL scrollEnabled;
/**是否有弹簧效果*/
@property (nonatomic, assign) BOOL bounces;
/**顶部是否有弹簧效果*/
@property (nonatomic, assign) BOOL topCloseBounces;
/**承载的子视图*/
@property (nonatomic, strong, readonly) NSArray<UIView *> *subVerticalViews;

/**
 添加一组子视图
 
 @param subviewArray NSArray<UIView *>
 */
- (void)addSubviewArray:(NSArray<UIView *> *)subviewArray;

/**
 添加子视图到bottomView的下面
 
 @param view 子视图
 @param bottomView 插入到View的后面
 */
- (void)addSubview:(UIView *)view toBottomView:(UIView *)bottomView;

/**
 添加子视图到frontView的前面
 
 @param view 子视图
 @param frontView 插入到View的前面
 */
- (void)addSubview:(UIView *)view toFrontView:(UIView *)frontView;

/**
 添加子视图到最顶部
 
 @param view 子视图
 */
- (void)addSubviewToTop:(UIView *)view;

/**
 添加子视图到最底部
 
 @param view 子视图
 */
- (void)addSubviewToBottom:(UIView *)view;

@end
