//
//  ViewController.m
//  WokflowTest
//
//  Created by Yue on 2018/5/7.
//  Copyright © 2018年 Yue. All rights reserved.
//

#import "ViewController.h"
#import "Define.h"
#import "Y_WorkflowView.h"
//#import <TengDi/WeBubble.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self loadDataSource:^(BOOL success, Y_WorkFlowModel *model) {
        if (success) {
            CGRect frame = CGRectMake(0, 50, SCREEN_WIDTH, SCREEN_HEIGHT-100);
            Y_WorkflowView *view = [[Y_WorkflowView alloc] initWithFrame:frame model:model];
            [self.view addSubview:view];
//            WeHideBubble();
        }
    }];
}

#pragma mark - ===== 加载数据 =====
- (void)loadDataSource:(void (^)(BOOL success, Y_WorkFlowModel*model))result {
    //NSURLSessionDataTask 请求网络数据
    NSString *getUrl = @"http://10.32.1.105:2026/WorkFlow/bill/Core/FlowChart/action.ashx?method=TengDi.Agile.WorkFlow.Core.WorkFlowHelper.GetWorkFlowChart&dll=TengDi.Agile.WorkFlow.Core&rnd=0.1375271402892997&LiuChengBiaoShi=13&LiuChengShiLiBiaoShi=&ParentId=-1";
    NSURLRequest *requestURL =[NSURLRequest requestWithURL:[NSURL URLWithString:getUrl]];
    
//    WeWaitBubble(@"加载中...");
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:requestURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        BOOL success = NO;
        Y_WorkFlowModel *model = nil;
        if (error) {
//            WeBubbleShowToast(error.description);
        }
        else {
            NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableLeaves) error:nil];
            model = [Y_WorkFlowModel yy_modelWithDictionary:resultDic];
            if (model.Steps.count) {
                success = YES;
            }
            else {
//                WeBubbleShowToast(@"暂无数据");
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            result (success, model);
        });
    }];
    [task resume];
    
//    //AFNetWorking 请求网络数据
//    NSString *url = @"http://10.32.1.105:2026/WorkFlow/bill/Core/FlowChart/action.ashx";
//    NSDictionary *parameters = @{
//                                 @"method":@"TengDi.Agile.WorkFlow.Core.WorkFlowHelper.GetWorkFlowChart",
//                                 @"dll":@"TengDi.Agile.WorkFlow.Core",
//                                 @"rnd":@"0.1375271402892997",
//                                 @"LiuChengBiaoShi":@"13",
//                                 @"LiuChengShiLiBiaoShi":@"",
//                                 @"ParentId":@"-1"
//                                 };
//    [WeHttpHelper setResponseSerializer:PPResponseSerializerHTTP];
//    [WeHttpHelper GET:url parameters:parameters success:^(id responseObject) {
//        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
//        Y_WorkFlowModel *model = [Y_WorkFlowModel yy_modelWithJSON:resultDic];
//        if (model.Steps.count) {
//            result(YES, model);
//        }
//        else {
//            result(NO, nil);
//        }
//    } failure:^(NSError *error) {
//        NSLog(@"F---->%@",error);
//        result(NO, nil);
//        WeBubbleShowToast(@"加载数据出错");
//    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
