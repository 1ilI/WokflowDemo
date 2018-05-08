//
//  Y_WorkFlowModel.m
//  WokflowTest
//
//  Created by Yue on 2018/5/8.
//  Copyright © 2018年 Yue. All rights reserved.
//

#import "Y_WorkFlowModel.h"

@implementation Y_StepModel

@end

@implementation Y_LineModel

@end

@implementation Y_WorkFlowModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"Steps" : [Y_StepModel class],
             @"Lines" : [Y_LineModel class],
             };
}
@end
