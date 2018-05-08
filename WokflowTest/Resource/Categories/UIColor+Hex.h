//
//  UIColor+Hex.h
//  IOSApp
//
//  Created by YUE on 2017/8/4.
//  Copyright © 2017年 YUE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor*)colorWithHexString:(NSString *)hexString;

+ (NSString *) hexFromUIColor: (UIColor*) color;

@end
