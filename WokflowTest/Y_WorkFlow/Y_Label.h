//
//  Y_Label.h
//  WokflowTest
//
//  Created by Yue on 2018/5/7.
//  Copyright © 2018年 Yue. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LabelStyle) {
    LabelStyle_Normal = 0,
    LabelStyle_Start,
    LabelStyle_End,
};

@interface Y_Label : UILabel

@property (assign, nonatomic) CGPoint topPoint;
@property (assign, nonatomic) CGPoint endPoint;
@property (assign, nonatomic) CGPoint leftPoint;
@property (assign, nonatomic) CGPoint rightPoint;
@property (assign, nonatomic) LabelStyle labelStyle;

- (instancetype)initWithTitle:(NSString *)title centerX:(CGFloat)centerX Y:(CGFloat)y;

@end
