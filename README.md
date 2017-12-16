# FPVerticalView

[![CI Status](http://img.shields.io/travis/fakepinge@gmail.com/FPVerticalView.svg?style=flat)](https://travis-ci.org/fakepinge@gmail.com/FPVerticalView)
[![Version](https://img.shields.io/cocoapods/v/FPVerticalView.svg?style=flat)](http://cocoapods.org/pods/FPVerticalView)
[![License](https://img.shields.io/cocoapods/l/FPVerticalView.svg?style=flat)](http://cocoapods.org/pods/FPVerticalView)
[![Platform](https://img.shields.io/cocoapods/p/FPVerticalView.svg?style=flat)](http://cocoapods.org/pods/FPVerticalView)

## Example
A container for the vertical layout subviews.
To run the example project, clone the repo, and run `pod install` from the Example directory first.

 <!--
 使用注意事项
  1.subVerticalViews 需要布局View数组
 有一些View一开始需要添加进来但是需要隐藏 隐藏的设置需要在addSubviewArray调用后再设置隐藏属性 如下:
 _verticaView = [[VerticalView alloc] initWithFrame:self.view.bounds];
 _verticaView.topMargin = 10;
 _verticaView.bottomMargin = 10;
 _verticaView.verMargin = 20;
 [_verticaView addSubviewArray:[self createView]];
 _view1.hidden = YES;
 _view3.hidden = YES;
 [self.view addSubview:_verticaView];
 2.Masonry布局的View 需要设置isMasonry属性为YES _view1.isMasonry = YES;
 仅仅只是针对这个view的布局,跟子视图无关;
 3.Masonry布局的View 更新高度 宽度之类的约束 需要用 mas_updateConstraints 这个方法
 4.不建议Frame Mansonry 两种布局混用
 5.混用时 子视图通过[_verticaView addSubviewArray:[self createView]]数组形式添加
 6.不建议addSubviewToTop等API一个一个的添加子视图 最好以数组的形式进行添加子视图
 -->

## Requirements

## Installation

FPVerticalView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'FPVerticalView'
```

## Author

fakepinge, fakepinge@gmail.com

## License

FPVerticalView is available under the MIT license. See the LICENSE file for more info.
