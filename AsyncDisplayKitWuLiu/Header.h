//
//  Header.h
//  HuaMao
//
//  Created by ZZCN77 on 2017/7/13.
//  Copyright © 2017年 ZZCN77. All rights reserved.
//

#ifndef Header_h
#define Header_h

#define kuserName @"userName"
#define kpassword @"password"
#define kuid @"kuid"
#define knickname @"nickname"
#define kwebViewurl @"webViewurl"

/** APP版本号 */
#define GFAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
/** APP BUILD 版本号 */
#define GFAppBuildVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
//
#define CustomLocalizedString(key, comment) \
[[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"]] ofType:@"lproj"]] localizedStringForKey:(key) value:@"" table:nil]
#define AppLanguage @"appLanguage"
/******* RGB颜色 *******/
#define GFColor(r, g, b, c) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0  blue:(b) / 255.0  alpha:c]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]/// rgb颜色转换（16进制->10进制）
//主题色
#define KTColor [UIColor colorWithRed:248/255.0 green:98/255.0 blue:1/255.0 alpha:1]

/******* 屏幕尺寸 *******/

#define kGAP 8
#define kThemeColor [UIColor colorWithRed:0 green:(190 / 255.0) blue:(12 / 255.0) alpha:1]
#define kAvatar_Size 40
#define GFMainScreenWidth [UIScreen mainScreen].bounds.size.width
#define GFMainScreenHeight [UIScreen mainScreen].bounds.size.height
#define GFMainScreenBounds [UIScreen mainScreen].bounds

#define widthScale GFMainScreenWidth / 375.0
#define heightScale GFMainScreenHeight / 667.0
// offsetY > -64 的时候导航栏开始偏移
#define NAVBAR_TRANSLATION_POINT 0
#define NavBarHeight 44
/******* 屏幕尺寸 *******/

/******网址链接*************/
#define keyUrl @"zzcn77"
//http://hs.tt.100help.net/
//域名
#define yumingUrl @"http://hs.tt.100help.net/"
//登录
#define loginUrl @"http://hs.tt.100help.net/api/login"
//找回密码
#define findpwdUrl @"http://hs.tt.100help.net/api/findpwd"
#define emailcodeUrl @"http://hs.tt.100help.net/api/emailcode"

//修改密码
#define editpwdpwdUrl @"http://hs.tt.100help.net/api/editpwd"
//订单列表以及详情
#define orderUrl @"http://hs.tt.100help.net/api/order"
#define ordernyUrl @"http://hs.tt.100help.net/api/order_ny"
//我的消息
#define messageUrl @"http://hs.tt.100help.net/api/mes"
//版本
#define iosverUrl @"http://hs.tt.100help.net/api/iosver"

/******网址链接*************/

/******* 日志打印替换 *******/
#ifdef DEBUG
// Debug
#define NSLog(FORMAT, ...) fprintf(stderr, "%s [%d lines] %s\n", __PRETTY_FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
// Release
#define NSLog(FORMAT, ...) nil
#endif
/******* 日志打印替换 *******/


//字符串是否为空
#define IsStrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref)isEqualToString:@""]))

//数组是否为空
#define IsArrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref) count] == 0))

#define OC(str) [NSString stringWithCString:(str) encoding:NSUTF8StringEncoding]

//安全释放
#define RELEASE_SAFELY(__REF) { (__REF) = nil;}

//view安全释放
#define VIEW_RELEASE_SAFELY(__REF) { [__REF removeFromSuperview]; __REF = nil; }

//释放定时器
#define INVALIDATE_TIMER(__TIMER) \
{\
[__TIMER invalidate];\
__TIMER = nil;\
}
#endif /* Header_h */
