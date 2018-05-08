//
//  Define.h
//  PunishmentAider
//
//  Created by Yue on 2017/12/20.
//  Copyright © 2017年 Yue. All rights reserved.
//

#ifndef Define_h
#define Define_h

#import "UIView+Frame.h"
#import "UIColor+Hex.h"

#define BLOCK__weak_self             __typeof__(self) __weak weakself = self
#define BLOCK__weak_other(other)     __typeof__(other) __weak weakother = other
#define BLOCK__strong_self           __strong __typeof(weakself) strongSelf = weakself

//颜色值
#define RGB(r, g, b)                [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.f]

//设备宽高
#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height
#define STATUSBAR_HEIGHT    [[UIApplication sharedApplication] statusBarFrame].size.height
#define NAVIGATION_HEIGHT   (IPHONEX_SIZE ? 88.0f : 64.0f)
#define TABBAR_HEIGHT       (IPHONEX_SIZE ? 83.0f : 49.0f)
#define MainViewHeight      SCREEN_HEIGHT - (IPHONEX_SIZE ? 88.0f : 64.0f)
#define Rect(x, y, w, h)    CGRectMake(x, y, w, h)

//单行文字高度
#define TextHeight(text, fontSize) [text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | \
NSStringDrawingUsesLineFragmentOrigin | \
NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size.height
//多行文字高度
#define MultableTextHeight(text, fontSize, width) [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | \
NSStringDrawingUsesLineFragmentOrigin | \
NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size.height
//文字长度
#define TextWidth(text, fontSize) [text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | \
NSStringDrawingUsesLineFragmentOrigin | \
NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size.width
//文字长度:UIFont
#define TextFontWidth(text, font) [text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | \
NSStringDrawingUsesLineFragmentOrigin | \
NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil].size.width

#define IPHONE4_SIZE     ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define IPHONE5_SIZE     ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IPHONE6_SIZE     ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define IPHONE6P_SIZE    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define IPHONEX_SIZE    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define UniversalHeightScale [[UIScreen mainScreen] currentMode].size.height/1334.0f
//根据6高度计算
#define View6Height(height) (height * (IPHONE4_SIZE ? 0.7196 : (IPHONE5_SIZE ? 0.8515 : (IPHONE6_SIZE ? 1 : ((IPHONE6P_SIZE || IPHONEX_SIZE) ? 1.1034 :UniversalHeightScale )))))

#endif /* Define_h */
