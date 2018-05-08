//
//  Y_WorkflowView.h
//  WokflowTest
//
//  Created by Yue on 2018/5/8.
//  Copyright © 2018年 Yue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Y_WorkFlowModel.h"

@interface Y_WorkflowView : UIScrollView

- (instancetype)initWithFrame:(CGRect)frame model:(Y_WorkFlowModel *)model;

@end
