//
//  Y_Label.m
//  WokflowTest
//
//  Created by Yue on 2018/5/7.
//  Copyright © 2018年 Yue. All rights reserved.
//

#import "Y_Label.h"
#import "Define.h"

@implementation Y_Label

- (instancetype)initWithTitle:(NSString *)title centerX:(CGFloat)centerX Y:(CGFloat)y {
    if (self = [super init]) {
        CGFloat itemH = 50;
        self.text = title;
        self.font = [UIFont systemFontOfSize:15];
        CGFloat titleW = TextWidth(title, self.font.pointSize);
        CGFloat itemW = titleW + 50;
        self.frame = CGRectMake((centerX*2-itemW)/2, y, itemW, itemH);
        self.textAlignment = NSTextAlignmentCenter;
        self.textColor = [UIColor blackColor];
        self.backgroundColor = [UIColor greenColor];
        
        self.layer.borderWidth = 1;
        self.layer.cornerRadius = 15;
        self.layer.borderColor = [UIColor redColor].CGColor;
        self.layer.masksToBounds = YES;
    }
    return self;
}

- (CGPoint)topPoint {
    return CGPointMake(self.left + self.width/2, self.top);
}

- (CGPoint)endPoint {
    return CGPointMake(self.left + self.width/2, self.top + self.height);
}

- (CGPoint)leftPoint {
    return CGPointMake(self.left, self.top + self.height/2);
}

- (CGPoint)rightPoint {
    return CGPointMake(self.left + self.width, self.top + self.height/2);
}

- (void)setLabelStyle:(LabelStyle)labelStyle {
    if (labelStyle == LabelStyle_Normal) {
        self.backgroundColor = RGB(182, 247, 147);
        self.layer.borderColor = RGB(120, 169, 101).CGColor;
    }
    else if (labelStyle == LabelStyle_Start) {
        self.backgroundColor =  RGB(175, 231, 218);
        self.layer.borderColor = RGB(31, 178, 139).CGColor;
    }
    else if (labelStyle == LabelStyle_End) {
        self.backgroundColor = RGB(236, 127, 170);
        self.layer.borderColor = [UIColor redColor].CGColor;
    }
}

@end
