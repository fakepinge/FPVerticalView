//
//  HFTCommonDefinition.h
//  Erp4iOS
//
//  Created by fakepinge on 2017/11/24.
//  Copyright © 2017年 成都好房通科技股份有限公司. All rights reserved.
//  ⚠️⚠️⚠️⚠️⚠️用于定义常用宏，可跨项目使用⚠️⚠️⚠️⚠️⚠️

#ifndef HFTCommonDefinition_h
#define HFTCommonDefinition_h

/* ------------------------------ 时间相关 ------------------------------*/
#define kSecondPerMinute 60UL
#define kSecondPerHour 3600UL
#define kSecondPerMinute 60UL
#define kSecondPerDay (24 * 3600UL)   //一天多少秒
#define kSecondPerWeek (7 * kSecondPerDay)

/* ------------------------------ 屏幕相关 ------------------------------*/
// 屏幕区域
#define kScreenRect ([UIScreen mainScreen].bounds)
// 屏幕分辨率
#define kScreenSize ([UIScreen mainScreen].bounds.size)
// 屏幕宽度
#define kScreenWidth (kScreenSize.width)
// 屏幕高度
#define kScreenHeight (kScreenSize.height)
// 状态栏高度
#define kStatusBarHeight (iPhoneX ? 44.f : 20.f)
// 导航栏高度
#define kNavigationBarHeight 44.f
// 顶部导航栏高度(状态栏和导航栏的高度)
#define kNavHeight (kStatusBarHeight + kNavigationBarHeight)
// 底部安全区域丢高度
#define kSafeBottomMargin (iPhoneX ? 34.f : 0.f)
// 底部安全区域总高度
#define kSafeMarginHeight (kNavHeight + kSafeBottomMargin)
// 标签栏高度
#define kTabbarHeight (iPhoneX ? (49.f + kSafeBottomMargin) : 49.f)
// 安全区域Insets
#define kViewSafeAreInsets(view) ({UIEdgeInsets insets; if(@available(iOS 11.0, *)) {insets = view.safeAreaInsets;} else {insets = UIEdgeInsetsZero;} insets;})

// iPhone4系列的屏幕分辨率
#define iPhoneScreenSize4 CGSizeMake(320,480)
// iPhone5系列的屏幕分辨率
#define iPhoneScreenSize5 CGSizeMake(320,568)
// iPhone6 7系列的屏幕分辨率
#define iPhoneScreenSize6 CGSizeMake(375,667)
// iPhonePlus系列的屏幕分辨率
#define iPhoneScreenSizePlus CGSizeMake(414,736)
// iPhoneX系列的屏幕分辨率
#define iPhoneScreenSizeX CGSizeMake(375,812)

/* ------------------------------ 设备型号 ------------------------------*/
// 广告唯一标识IDFA
#define CURRENT_DEVICEID [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString]
// 设备
#define CURRENT_DEVICE [UIDevice currentDevice]
// 设备用户名
#define DEVICE_USERNAME [CURRENT_DEVICE name]
// 设备类型名
#define DEVICE_TYPENAME [CURRENT_DEVICE model]
// 设备地方类型名
#define DEVICE_LOCAL_TYPENAME [CURRENT_DEVICE localizedModel]
// 是否为iPhone
#define iPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
// 是否是iPad
#define iPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
// 是否为iPod
#define iPod ([DEVICE_TYPENAME isEqualToString:@"iPod touch"])
// 是否为iPone模拟器
#define iPhoneSimulator ([DEVICE_TYPENAME isEqualToString:@"iPhone Simulator"])
// 是否为iPhone4/4S
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640,960), [[UIScreen mainScreen] currentMode].size) : NO)
// 是否为iPhone5/5C/5S/SE
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640,1136), [[UIScreen mainScreen] currentMode].size) : NO)
// 是否为iPhone6/6S/7/7S
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750,1334), [[UIScreen mainScreen] currentMode].size) : NO)
// 是否为iPhone6*Plus/7*Plus
#define iPhone6P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242,2208), [[UIScreen mainScreen] currentMode].size) : NO)
// 是否为iPhoneX
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125,2436), [[UIScreen mainScreen] currentMode].size) : NO)


/* ------------------------------ 系统版本 ------------------------------*/
// 系统名称
#define SYS_NAME [CURRENT_DEVICE systemName]
// 系统版本
#define SYS_VERSION [CURRENT_DEVICE systemVersion]
// 系统版本号
#define SYS_VERSION_FLOAT [SYS_VERSION floatValue]
// 判断系统版本，如：iOS(8) 或者 iOS(9.2)
#define iOS(f) (SYS_VERSION_FLOAT >= f)
// 获取系统版本
#define iOS_VERSION ([[[UIDevice currentDevice] systemVersion] floatValue])
// 编译环境
#define XCODE8 (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0)
// 系统版本大于等于7.0
#define iOS7 iOS(7.0)
// 系统版本大于等于8.0
#define iOS8 iOS(8.0)


/* ------------------------------ 应用信息 ------------------------------*/
// App信息字典
#define APP_INFO [[NSBundle mainBundle] infoDictionary]
// App名称
#define APP_NAME [APP_INFO objectForKey:@"CFBundleDisplayName"]
// App版本
#define APP_VERSION [APP_INFO objectForKey:@"CFBundleShortVersionString"]
// App的build版本
#define BUILD_VERSION [APP_INFO objectForKey:@"CFBundleVersion"]


/* ------------------------------ UI适配 ------------------------------*/
// 相对iphone5 屏幕比
#define kScreenWidthScale5   (kScreenWidth/320.f)
#define kScreenHeightScale5 (kScreenHeight/568.0f)
// 相对iphone6 屏幕比
#define kScreenWidthScale6   (kScreenWidth/375.0f)
#define kScreenHeightScale6  (kScreenHeight/667.0f)
// 相对iphone6P 屏幕比
#define kScreenWidthScale6P  (kScreenWidth/414.0f)
#define kScreenHeightScale6P (kScreenHeight/736.0f)
// 三个屏幕尺寸对应的宽度高度 从大到小
#define kLMSScreenFit(L,M,S) ((iPhone6P||kScreenWidth>414.0f) ? (L) : ((iPhone6||iPhoneX||kScreenWidth>375.0f) ? (M) : (S)))
// 建议用这个适配
#define kLMS(L,M,S) kLMSScreenFit(L,M,S)
#define kScaleRatio (kScreenWidthScale6>1.0?1.1:1.0)
// 适配大小 iPhone6 pt
#define kViewSize6(Size) ((Size)*kScaleRatio)
#define kFontPointSize6(Size) ((Size)*kScaleRatio)
#define kFontSize6(Size) [UIFont systemFontOfSize:kFontPointSize6(Size)]
#define kFontBoldSize6(Size) [UIFont boldSystemFontOfSize:kFontPointSize6(Size)]
// 适配大小 iPhone6 px
#define kMarkViewSize6(Size) ((Size*0.5)*kScaleRatio)
#define kMarkFontPointSize6(Size) ((Size*0.5)*kScaleRatio)
#define kMarkFontSize6(Size) [UIFont systemFontOfSize:kMarkFontPointSize6(Size)]
#define kMarkFontBoldSize6(Size) [UIFont boldSystemFontOfSize:kMarkFontPointSize6(Size)]


/* ------------------------------ 类型转换 ------------------------------*/

//整型转字符串【推荐使用】
#define HFTI2S(i) [NSString stringWithFormat:@"%ld",(long)(i)]
//浮点型转字符串【推荐使用】
#define HFTF2S(f) [NSString stringWithFormat:@"%f",(f)]
//浮点型转字符串，可以控制精度【推荐使用】
#define HFTF2S_P(f,p) [NSString stringWithFormat:@"%.#pf",(f)]
// int转NSString 【已废弃，不要再使用】
#define INT2STR(i) HFTI2S(i)
// float转NSString【已废弃，不要再使用】
#define FLOAT2STR(f) HFTF2S_P(f,4)
// 16进制字符串转换为数字(无符号长整型)
#define HEXSTR2ULONG(str) strtoul([(str) UTF8String],0,16)


/* ------------------------------ 颜色相关 ------------------------------*/
// 16进制颜色+透明度
#define HEX_RGBA(rgbValue, alphaValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0f \
green:((float)((rgbValue & 0x00FF00) >> 8))/255.0f \
blue:((float)(rgbValue & 0x0000FF))/255.0f \
alpha:alphaValue]
// 16进制颜色
#define HEX_RGB(rgbValue) HEX_RGBA(rgbValue, 1.0)
// RGB颜色+透明度
#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]
// RGB颜色
#define RGB(r,g,b) RGBA(r,g,b,1)
// RGB颜色 灰色
#define RGBGRAY(A) RGB(A,A,A)
// 随机颜色
#define ARC4COLOR RGB(arc4random()%256,arc4random()%256,arc4random()%256)

/* ------------------------------ 加载图片 ------------------------------*/
// 根据路径加载本地图片，如：imgView.image = FILE_IMAGE(@"banner",@"png");
#define FILE_IMAGE_EXT(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(file) ofType:ext]]
// 根据路径加载本地图片，如：imgView.image = FILE_IMAGE(@"banner.png");
#define FILE_IMAGE(file) FILE_IMAGE_EXT(file,nil)
// 根据资源名称加载图片，如：imgView.image = NAMED_IMAGE(@"banner_");
#define NAMED_IMAGE(name) [UIImage imageNamed:(name)]
// 根据资源名称和bundle加载图片，如：imgView.image = NAMED_IMAGE(@"banner_");
#define NAME_BUNDLE_IMAGE(bundle,name) [UIImage imageNamed:([NSString stringWithFormat:@"%@.bundle/%@", (bundle), (name)])]

/* ------------------------- NSUserDefaults的相关 ------------------------*/
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]
// 获得存储的对象
#define UserDefaultSetObjectForKey(__VALUE__,__KEY__) \
{\
[[NSUserDefaults standardUserDefaults] setObject:__VALUE__ forKey:__KEY__];\
[[NSUserDefaults standardUserDefaults] synchronize];\
}
// 取值
#define UserDefaultObjectForKey(__KEY__)  [[NSUserDefaults standardUserDefaults] objectForKey:__KEY__]
// 删除对象
#define UserDefaultRemoveObjectForKey(__KEY__) \
{\
[[NSUserDefaults standardUserDefaults] removeObjectForKey:__KEY__];\
[[NSUserDefaults standardUserDefaults] synchronize];\
}


/* --------------------------- 安全执行block -----------------------------*/
#define EXECUTE_BLOCK(A,...) if(A){A(__VA_ARGS__);}


/* ------------------------------ GCD线程 -------------------------------*/
#define dispatch_sync_main_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_sync(dispatch_get_main_queue(), block);\
}

#define dispatch_async_main_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}

#define HFT_GLOBAL_ASYNC_BEGIN dispatch_async(dispatch_get_global_queue(0,0), ^{
#define HFT_GLOBAL_ASYNC_END   });

#define HFT_MAIN_ASYNC_BEGIN dispatch_async(dispatch_get_main_queue(), ^{
#define HFT_MAIN_ASYNC_END   });


/* ------------------------------ 其它辅助 ------------------------------*/
// 调试时打印
#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#endif
// 获取主Window
#define KEY_WINDOW [UIApplication sharedApplication].keyWindow
// self的弱引用
#define WEAK_TYPES(instance) __weak typeof(instance) weak##instance = instance;
#define LazyWeakSelf __weak typeof(self) weakSelf = self;
// UIAlertView弹框
#define ZHALERT_WITH_TITLE(title,cancleText,otherText,msg) static UIAlertView *alert; alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:self cancelButtonTitle:cancleText otherButtonTitles:otherText, nil];\
[alert show];\
// 加载XIB
#define ALLOC_WITH_CLASSNAME(className)[UINib nibWithNibName:className bundle:[NSBundle mainBundle]] ? [[NSClassFromString(className) alloc] initWithNibName:className bundle:[NSBundle mainBundle]] : [[NSClassFromString(className) alloc] init]
// 日志分隔线
#define LOG_LINE_BEG @"\n->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n"
#define LOG_LINE_END @"\n<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<-"
// App运行环境
#define APP_RUNNING_ENV [NSString stringWithFormat:@"%@%@(%@)运行在%@的%@(%@ %@)上...%@",LOG_LINE_BEG,APP_NAME,BUILD_VERSION,DEVICE_USERNAME,DEVICE_LOCAL_TYPENAME,SYS_NAME,SYS_VERSION,LOG_LINE_END]

#endif /* HFTCommonDefinition_h */
