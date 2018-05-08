//
//  Y_WorkFlowModel.h
//  WokflowTest
//
//  Created by Yue on 2018/5/8.
//  Copyright © 2018年 Yue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+YYModel.h"

@interface Y_StepModel : NSObject

@property NSString *StepUid;
@property NSString *Retreat;
@property NSString *StepId;
@property NSString *StepName;
@property NSString *StepTime;
@property NSString *Status;
@property NSString *StepType;

@end


@interface Y_LineModel : NSObject

@property NSString *LineId;
@property NSString *LineIn;
@property NSString *LineOut;
@property NSString *Type;
@property NSString *Anchors;

@end


@interface Y_WorkFlowModel : NSObject

@property NSArray <Y_StepModel *> *Steps;
@property NSArray <Y_LineModel *> *Lines;

@end
