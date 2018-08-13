//
//  FPViewController.m
//  FPVerticalView
//
//  Created by fakepinge@gmail.com on 08/11/2018.
//  Copyright (c) 2018 fakepinge@gmail.com. All rights reserved.
//

#import "FPViewController.h"
#import "FPVerticalView.h"
#import "HFTCommonDefinition.h"
#import "UIView+Frame.h"
#import <Masonry/Masonry.h>

#define kWidth 30
#define kHeght 50

@interface FPViewController ()

@property (nonatomic, strong) FPVerticalView *verticaView;

@property (nonatomic, strong) FPVerticalView *verticaView1;

@property (nonatomic, strong) FPVerticalView *verticaView2;


/**view*/
@property (nonatomic, strong) UIView *view0;
/**view*/
@property (nonatomic, strong) UIView *view1;
/**view*/
@property (nonatomic, strong) UIView *view2;
/**view*/
@property (nonatomic, strong) UIView *view3;
/**view*/
@property (nonatomic, strong) UIView *view4;
/**view*/
@property (nonatomic, strong) UIView *view5;
/**view*/
@property (nonatomic, strong) UIView *view6;
/**view*/
@property (nonatomic, strong) UIView *view7;
/**view*/
@property (nonatomic, strong) UILabel *view8;
/**view*/
@property (nonatomic, strong) UIView *view9;

/**view*/
@property (nonatomic, strong) UIView *subview0;
/**view*/
@property (nonatomic, strong) UIView *subview1;
/**view*/
@property (nonatomic, strong) UIView *subview2;

/**view*/
@property (nonatomic, strong) UIView *subview3;
/**view*/
@property (nonatomic, strong) UIView *subview4;
/**view*/
@property (nonatomic, strong) UIView *subview5;

@end

@implementation FPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];
}

- (NSMutableArray *)createView {
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:self.view0];
    [array addObject:self.view1];
    [array addObject:self.view2];
    [array addObject:self.view3];
    [array addObject:self.view4];
    [array addObject:self.view5];
    [array addObject:self.view6];
    [array addObject:self.view7];
    [array addObject:self.view8];
    [array addObject:self.view9];
    [array enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(test:)];
        [obj addGestureRecognizer:tap];
    }];
    if (self.isOnelayersOfNested) {
        [array addObject:self.verticaView1];
    }
    return array;
}

- (NSMutableArray *)createView1 {
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:self.subview0];
    [array addObject:self.subview1];
    [array addObject:self.subview2];
    if (self.isTwolayersOfNested) {
        [array addObject:self.verticaView2];
    }
    return array;
}

- (NSMutableArray *)createView2 {
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:self.subview3];
    [array addObject:self.subview4];
    [array addObject:self.subview5];
    return array;
}

- (void)test:(UITapGestureRecognizer *)tap {
    NSInteger ret = arc4random() % 2;
    if (ret) {
        tap.view.hidden = YES;
    } else {
        if (tap.view.isMasonry) {
            [tap.view mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(tap.view.height * 2);
            }];
        } else {
            tap.view.height = tap.view.height * 2;
        }
    }
}


#pragma mark - 是否嵌套一层垂直容器
- (BOOL)isOnelayersOfNested {
    return YES;
}

#pragma mark - 是否嵌套两层垂直容器
- (BOOL)isTwolayersOfNested {
    return YES;
}

#pragma mark - 初始化界面
- (void)createUI {

    _verticaView = [[FPVerticalView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64)];
    _verticaView.topMargin = 10;
    _verticaView.bottomMargin = 10;
    _verticaView.verMargin = 20;
    [self.view addSubview:_verticaView];
    
    _verticaView1 = [[FPVerticalView alloc] init];
    _verticaView1.isMasonry = YES;
    [_verticaView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(300);
        make.height.mas_equalTo([self isTwolayersOfNested]?(kHeght * 24):(kHeght * 12));
    }];
    
    _verticaView2 = [[FPVerticalView alloc] init];
    _verticaView2.isMasonry = YES;
    [_verticaView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(300);
        make.height.mas_equalTo(kHeght * 12);
    }];
    
    [_verticaView addSubviewArray:[self createView]];
    [_verticaView1 addSubviewArray:[self createView1]];
    [_verticaView2 addSubviewArray:[self createView2]];
}

- (void)createTestButton {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"测试" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blackColor];
        button.frame = CGRectMake(150, 100, 150, 150);
//        [button addTarget:self action:@selector(test2:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button1 setTitle:@"测试" forState:UIControlStateNormal];
        [button1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        button1.backgroundColor = [UIColor blackColor];
        button1.frame = CGRectMake(150, 300, 150, 150);
//        [button1 addTarget:self action:@selector(test3:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button1];
}

 - (void)test1:(UIButton *)sender {
     [sender mas_updateConstraints:^(MASConstraintMaker *make) {
         make.height.mas_equalTo(@500);
     sender.superview.hidden = YES;
     }];
 }
 
- (UIView *)view0 {
    if (!_view0) {
        _view0 = [[UIView alloc] init];
        _view0.backgroundColor = ARC4COLOR;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor clearColor];
        [button setTitle:@"1" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_view0 addSubview:button];
        _view0.isMasonry = YES;
        [_view0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(kWidth);
        }];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.right.equalTo(_view0);
            make.height.mas_equalTo(kHeght);
        }];
        [button addTarget:self action:@selector(test1:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _view0;
}

- (UIView *)view1 {
    if (!_view1) {
        _view1 = [[UIView alloc] init];
        _view1.backgroundColor = ARC4COLOR;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor clearColor];
        [button setTitle:@"1" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_view1 addSubview:button];
        _view1.isMasonry = YES;
        [_view1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(kWidth * 2);
        }];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.right.equalTo(_view1);
            make.height.mas_equalTo(kHeght * 2);
        }];
        [button addTarget:self action:@selector(test1:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _view1;
}

- (UIView *)view2 {
    if (!_view2) {
        _view2 = [[UIView alloc] init];
        _view2.backgroundColor = ARC4COLOR;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor clearColor];
        [button setTitle:@"1" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_view2 addSubview:button];
        _view2.isMasonry = YES;
        [_view2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(kWidth * 3);
        }];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.right.equalTo(_view2);
            make.height.mas_equalTo(kHeght * 3);
        }];
        [button addTarget:self action:@selector(test1:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _view2;
}

- (UIView *)view3 {
    if (!_view3) {
        _view3 = [[UIView alloc] init];
        _view3.backgroundColor = ARC4COLOR;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor clearColor];
        [button setTitle:@"1234" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_view3 addSubview:button];
        _view3.isMasonry = YES;
        [_view3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(kWidth * 4);
        }];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.right.equalTo(_view3);
            make.height.mas_equalTo(kHeght * 4);
        }];
        [button addTarget:self action:@selector(test1:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _view3;
}

- (UIView *)view4 {
    if (!_view4) {
        _view4 = [[UIView alloc] init];
        _view4.width = kWidth * 5;
        _view4.height = kHeght * 5;
        _view4.origin = CGPointZero;
        _view4.backgroundColor = ARC4COLOR;
    }
    return _view4;
}

- (UIView *)view5 {
    if (!_view5) {
        _view5 = [[UIView alloc] init];
        _view5.width = kWidth * 6;
        _view5.height = kHeght * 6;
        _view5.origin = CGPointZero;
        _view5.backgroundColor = ARC4COLOR;
    }
    return _view5;
}

- (UIView *)view6 {
    if (!_view6) {
        _view6 = [[UIView alloc] init];
        _view6.width = kWidth * 7;
        _view6.height = kHeght * 7;
        _view6.origin = CGPointZero;
        _view6.backgroundColor = ARC4COLOR;
    }
    return _view6;
}

- (UIView *)view7 {
    if (!_view7) {
        _view7 = [[UIView alloc] init];
        _view7.width = kWidth * 8;
        _view7.height = kHeght * 8;
        _view7.origin = CGPointZero;
        _view7.backgroundColor = ARC4COLOR;
    }
    return _view7;
}

- (UILabel *)view8 {
    if (!_view8) {
        _view8 = [[UILabel alloc] init];
        _view8.width = kWidth * 9;
        _view8.height = kHeght * 9;
        _view8.origin = CGPointZero;
        _view8.backgroundColor = ARC4COLOR;
        _view8.text = @"i am 8 Label";
    }
    return _view8;
}

- (UIView *)view9 {
    if (!_view9) {
        _view9 = [[UIView alloc] init];
        _view9.backgroundColor = ARC4COLOR;
        _view9.isMasonry = YES;
        [_view9 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(kWidth * 10);
            make.height.mas_equalTo(kHeght * 10);
        }];
        
    }
    return _view9;
}

- (UIView *)subview0 {
    if (!_subview0) {
        _subview0 = [[UIView alloc] init];
        _subview0.backgroundColor = [UIColor blackColor];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor clearColor];
        [button setTitle:@"1sasf" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_subview0 addSubview:button];
        _subview0.isMasonry = YES;
        [_subview0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(kWidth * 4);
            make.height.mas_equalTo(kHeght * 4);
        }];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.right.equalTo(_subview0);
        }];
    }
    return _subview0;
}

- (UIView *)subview1 {
    if (!_subview1) {
        _subview1 = [[UIView alloc] init];
        _subview1.width = kWidth * 2;
        _subview1.height = kHeght * 2;
        _subview1.origin = CGPointZero;
        _subview1.backgroundColor = ARC4COLOR;
    }
    return _subview1;
}

- (UIView *)subview2 {
    if (!_subview2) {
        _subview2 = [[UIView alloc] init];
        _subview2.width = kWidth * 6;
        _subview2.height = kHeght * 6;
        _subview2.origin = CGPointZero;
        _subview2.backgroundColor = ARC4COLOR;
    }
    return _subview2;
}

- (UIView *)subview3 {
    if (!_subview3) {
        _subview3 = [[UIView alloc] init];
        _subview3.backgroundColor = [UIColor blackColor];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor clearColor];
        [button setTitle:@"1sasf" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_subview3 addSubview:button];
        _subview3.isMasonry = YES;
        [_subview3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(kWidth * 4);
            make.height.mas_equalTo(kHeght * 4);
        }];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.right.equalTo(_subview3);
        }];
    }
    return _subview3;
}

- (UIView *)subview4 {
    if (!_subview4) {
        _subview4 = [[UIView alloc] init];
        _subview4.width = kWidth * 2;
        _subview4.height = kHeght * 2;
        _subview4.origin = CGPointZero;
        _subview4.backgroundColor = ARC4COLOR;
    }
    return _subview4;
}

- (UIView *)subview5 {
    if (!_subview5) {
        _subview5 = [[UIView alloc] init];
        _subview5.width = kWidth * 6;
        _subview5.height = kHeght * 6;
        _subview5.origin = CGPointZero;
        _subview5.backgroundColor = ARC4COLOR;
    }
    return _subview5;
}

@end
