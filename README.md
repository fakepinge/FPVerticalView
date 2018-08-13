# FPVerticalView

[![CI Status](https://img.shields.io/travis/fakepinge@gmail.com/FPVerticalView.svg?style=flat)](https://travis-ci.org/fakepinge@gmail.com/FPVerticalView)
[![Version](https://img.shields.io/cocoapods/v/FPVerticalView.svg?style=flat)](https://cocoapods.org/pods/FPVerticalView)
[![License](https://img.shields.io/cocoapods/l/FPVerticalView.svg?style=flat)](https://cocoapods.org/pods/FPVerticalView)
[![Platform](https://img.shields.io/cocoapods/p/FPVerticalView.svg?style=flat)](https://cocoapods.org/pods/FPVerticalView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Introduce

这是一个垂直布局的容器，在容器里添加一组视图，容器里的子视图支持frame和约束两种布局方式，容器会根据子视图添加的顺序自动实现从上到下的布局，间隔统一，也可以针对每个子视图设置特殊的间隔，这里你不需要关心子视图具体的位置，当你需要隐藏子视图，只需设置hidden属性容器会自动刷新布局并且处理间隔，当你需要改变子视图的宽度高度，只需修改视图的宽高，容器会自动刷新布局，使用起来非常方便简洁！！！


Usage
==============
## base
```objc
FPVerticalView *verticaView = [[FPVerticalView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64)];
verticaView.topMargin = 10;
verticaView.bottomMargin = 10;
// 每个子view的统一间隔，也可以对子view单独设置间隔
verticaView.verMargin = 20;
[self.view addSubview:verticaView];
[verticaView addSubviewArray:[self createView]];

 //  createView的方法
 NSMutableArray *arrayM = [NSMutableArray array];
 NSArray *array = @[self.view0, self.view1, self.view1, self.view2, self.view3, self.view4, self.view5, self.view6, self.view7, self.view8, self.view9];
 [arrayM addObjectsFromArray:array];
 // 嵌套一层垂直容器
 // 申明可以多层嵌套，嵌套的垂直容器需要自己管理自己的内容高度
 if (self.isOnelayersOfNested) {
     [arrayM addObject:self.verticaView1];
 }

 // view的创建 约束布局
 view1 = [[UIView alloc] init];
 view1.backgroundColor = ARC4COLOR;
 // 约束布局的要对这个属性设置
 view1.isMasonry = YES;
 /**
 [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
     make.width.mas_equalTo(kWidth * 2);
 }]   
 */

 // view的创建 frame布局
 view5 = [[UIView alloc] init];
 view5.backgroundColor = ARC4COLOR;
 view5.width = kWidth * 6;
 view5.height = kHeght * 6;
 view5.origin = CGPointZero;
 // 是否自己设置间距
 view5.hasSpecialMargin = YES;
 // 间距
 view5.verMargin = 30;
```

## 使用注意事项
```objc
// 1.subVerticalViews 需要布局View数组
//  有一些View一开始需要添加进来但是需要隐藏 隐藏的设置需要在addSubviewArray调用后再设置隐藏属性 如下:
FPVerticalView *verticaView = [[FPVerticalView alloc] initWithFrame:self.view.bounds];
verticaView.topMargin = 10;
verticaView.bottomMargin = 10;
verticaView.verMargin = 20;
[verticaView addSubviewArray:[self createView]];
view1.hidden = YES;
view3.hidden = YES;
[self.view addSubview:verticaView];
// 2.Masonry布局的View 需要设置isMasonry属性为YES view1.isMasonry = YES;
// 仅仅只是针对这个view的布局,跟子视图无关;
// 3.Masonry布局的View 更新高度 宽度之类的约束 需要用 mas_updateConstraints 这个方法
// 4.不建议Frame Mansonry 两种布局混用
// 5.混用时 子视图通过[_verticaView addSubviewArray:[self createView]]数组形式添加
// 6.不建议addSubviewToTop等API一个一个的添加子视图 最好以数组的形式进行添加子视图
 ```

## Requirements

## Installation

FPVerticalView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'FPVerticalView'
```

## Author

fakepinge, fakepinge@gmail.com

## License

FPVerticalView is available under the MIT license. See the LICENSE file for more info.
