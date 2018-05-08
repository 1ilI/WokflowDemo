//
//  Y_WorkflowView.m
//  WokflowTest
//
//  Created by Yue on 2018/5/8.
//  Copyright © 2018年 Yue. All rights reserved.
//

#import "Y_WorkflowView.h"
#import "Define.h"
#import "Y_Label.h"
#import "Y_Line.h"

@interface Y_WorkflowView ()

@property (copy, nonatomic) NSArray <Y_Label *> *labelsArr;
@property (copy, nonatomic) NSArray <Y_Line *>  *linesArr;

@end

@implementation Y_WorkflowView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame model:(Y_WorkFlowModel *)model {
    if (self = [super initWithFrame:frame]) {
        CGFloat width = frame.size.width;
        
        NSMutableArray *tmpStepArr = [NSMutableArray array];
        [model.Steps enumerateObjectsUsingBlock:^(Y_StepModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            Y_Label *label = [[Y_Label alloc] initWithTitle:obj.StepName centerX:width/2 Y:idx*90];
            if ([obj.Status isEqualToString:@"normal"]) {
                [label setLabelStyle:LabelStyle_Normal];
            }
            else if ([obj.Status isEqualToString:@"begin"]) {
                [label setLabelStyle:LabelStyle_Start];
            }
            else if ([obj.Status isEqualToString:@"end"]) {
                [label setLabelStyle:LabelStyle_End];
            }
            [self addSubview:label];
            [tmpStepArr addObject:label];
            
            if (idx == model.Steps.count-1) {
                self.contentSize = CGSizeMake(width, label.bottom + 100);
            }
        }];
        self.labelsArr = [NSArray arrayWithArray:tmpStepArr];
        

        [model.Lines enumerateObjectsUsingBlock:^(Y_LineModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *lineIn = obj.LineIn;
            NSString *lineOut = obj.LineOut;
            
            if ([obj.Type isEqualToString:@"back"]) {
                Y_Label *label1 = [self.labelsArr objectAtIndex:[lineOut integerValue] -1];
                Y_Label *label2 = [self.labelsArr objectAtIndex:[lineIn integerValue] -1];
                
                Y_Line *line1 = [[Y_Line alloc] initWithLineType:LineType_Back startPoint:label1.rightPoint endPoint:label2.rightPoint];
                [self addSubview:line1];
            }
            else {
                Y_Label *label1 = [self.labelsArr objectAtIndex:[lineIn integerValue] -1];
                Y_Label *label2 = [self.labelsArr objectAtIndex:[lineOut integerValue] -1];
                
                Y_Line *line1 = [[Y_Line alloc] initWithLineType:LineType_Forward startPoint:label1.endPoint endPoint:label2.topPoint];
                [self addSubview:line1];
            }
        }];
    }
    return self;
}

@end
