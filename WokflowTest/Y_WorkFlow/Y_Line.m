//
//  Y_Line.m
//  WokflowTest
//
//  Created by Yue on 2018/5/7.
//  Copyright © 2018年 Yue. All rights reserved.
//

#import "Y_Line.h"

#define LineWidth 2.0f

@interface Y_Line ()

@property (assign, nonatomic) CGPoint startPoint;
@property (assign, nonatomic) CGPoint cornerPoint1;  //第一个直角拐点
@property (assign, nonatomic) CGPoint cornerPoint2;  //第二个直角拐点
@property (assign, nonatomic) CGPoint endPoint;
@property (assign, nonatomic) LineType lineType;

@end

@implementation Y_Line

- (instancetype)initWithLineType:(LineType)type startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    if (self = [super init]) {
        self.lineType = type;
        
        if (self.lineType == LineType_Back) {
            CGFloat x = startPoint.x <= endPoint.x ? startPoint.x : endPoint.x;
            CGFloat y = startPoint.y -10;
            CGFloat width = ABS(startPoint.x - endPoint.x) + 30;
            CGFloat height = ABS(startPoint.y - endPoint.y)  +20;
            self.frame = CGRectMake(x, y, width, height);
//            self.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.4];
            self.backgroundColor = [UIColor clearColor];

            if (startPoint.x <= endPoint.x) {
                self.startPoint = CGPointMake(0, LineWidth+5);
                self.cornerPoint1 = CGPointMake(width-LineWidth-5, LineWidth+5);
                self.cornerPoint2 = CGPointMake(width-LineWidth-5, height-13.5);
                self.endPoint = CGPointMake(endPoint.x - startPoint.x, height-13.5);
            }
            else {
                self.startPoint = CGPointMake(startPoint.x - endPoint.x, LineWidth+5);
                self.cornerPoint1 = CGPointMake(width-LineWidth-5, LineWidth+5);
                self.cornerPoint2 = CGPointMake(width-LineWidth-5, height-13.5);
                self.endPoint = CGPointMake(0, height-13.5);
            }
        }
        
        else if (self.lineType == LineType_Forward) {
            CGFloat x = startPoint.x - 10;
            CGFloat y = startPoint.y;
            CGFloat width = 20;
            CGFloat height = endPoint.y - startPoint.y;
            self.frame = CGRectMake(x, y, width, height);
//            self.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.4];
            self.backgroundColor = [UIColor clearColor];
            
            self.startPoint = CGPointMake((width-LineWidth)/2, 0);
            self.endPoint = CGPointMake((width-LineWidth)/2, height);
        }
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = LineWidth;

    if (self.lineType == LineType_Back) {
        UIColor *color = [UIColor orangeColor];
        [color set]; //设置线条颜色
        
        [path moveToPoint:self.startPoint];
        [path addLineToPoint:CGPointMake(self.startPoint.x+8, 0)];
        [path moveToPoint:self.startPoint];
        [path addLineToPoint:CGPointMake(self.startPoint.x+8, 15)];
        
        [path moveToPoint:self.startPoint];
        [path addLineToPoint:self.cornerPoint1];
        [path addLineToPoint:self.cornerPoint2];
        [path addLineToPoint:self.endPoint];
    }
    
    else if (self.lineType == LineType_Forward) {
        UIColor *color = [UIColor redColor];
        [color set]; //设置线条颜色
        
        [path moveToPoint:self.startPoint];
        [path addLineToPoint:self.endPoint];
        [path addLineToPoint:CGPointMake(self.endPoint.x-9, self.endPoint.y - 9)];
        [path moveToPoint:self.endPoint];
        [path addLineToPoint:CGPointMake(self.endPoint.x+9, self.endPoint.y - 9)];
    }

    [path stroke];
}

@end
