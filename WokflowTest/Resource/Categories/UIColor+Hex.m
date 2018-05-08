//
//  UIColor+Hex.m
//  IOSApp
//
//  Created by YUE on 2017/8/4.
//  Copyright © 2017年 YUE. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (UIColor*)colorWithHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    hexString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner scanHexInt:&rgbValue];
    
    return [[self class] colorWithR:((rgbValue & 0xFF0000) >> 16) G:((rgbValue & 0xFF00) >> 8) B:(rgbValue & 0xFF) A:1.0];
}

+ (NSString *) hexFromUIColor: (UIColor*) color {
    NSArray *colorArray	= [self rgbaArrayWithColor:color];
    int r = [colorArray[0] floatValue] * 255;
    int g = [colorArray[1] floatValue] * 255;
    int b = [colorArray[2] floatValue] * 255;
    NSString *red = [NSString stringWithFormat:@"%02x", r];
    NSString *green = [NSString stringWithFormat:@"%02x", g];
    NSString *blue = [NSString stringWithFormat:@"%02x", b];
    
    return [NSString stringWithFormat:@"#%@%@%@", red, green, blue];
}

+ (UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha {
    return [[self class] colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}

+ (NSArray *)rgbaArrayWithColor:(UIColor *)color {

    CGFloat r=0,g=0,b=0,a=0;
    if ([color respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [color getRed:&r green:&g blue:&b alpha:&a];
    }
    else {
        const CGFloat *components = CGColorGetComponents(color.CGColor);
        r = components[0];
        g = components[1];
        b = components[2];
        a = components[3];
    }
    
    return @[@(r),
             @(g),
             @(b),
             @(a)];
}

@end
