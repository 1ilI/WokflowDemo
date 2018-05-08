//
//  Y_Line.h
//  WokflowTest
//
//  Created by Yue on 2018/5/7.
//  Copyright © 2018年 Yue. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef NS_ENUM(NSInteger, LineType) {
    LineType_Forward = 0,
    LineType_Back,
};

@interface Y_Line : UIView

- (instancetype)initWithLineType:(LineType)type startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

@end
