//
//  Header.h
//  HuaMao
//
//  Created by ZZCN77 on 2017/7/13.
//  Copyright © 2017年 ZZCN77. All rights reserved.
//

#ifndef Header_h
#define Header_h


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
#define KTColor [UIColor colorWithRed:148/255.0 green:0/255.0 blue:211/255.0 alpha:1]

/******* 屏幕尺寸 *******/

#define kGAP 8
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


/******* 日志打印替换 *******/
#ifdef DEBUG
// Debug
#define NSLog(FORMAT, ...) fprintf(stderr, "%s [%d lines] %s\n", __PRETTY_FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
// Release
#define NSLog(FORMAT, ...) nil
#endif
/******* 日志打印替换 *******/


#endif /* Header_h */
