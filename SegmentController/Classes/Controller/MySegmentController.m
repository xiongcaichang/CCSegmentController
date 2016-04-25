//
//  MySegmentController.m
//  SegmentController
//  URL: http://www.xiongcaichang.com
//  Created by bear on 16/4/16.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "MySegmentController.h"
#import "TestTableController.h"

@interface MySegmentController ()

@end

@implementation MySegmentController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.titleArr = @[@"首页",@"小说",@"视频",@"旅游",@"文化"];

    TestTableController *tb1=[[TestTableController alloc]init];
    TestTableController *tb2=[[TestTableController alloc]init];
    TestTableController *tb3=[[TestTableController alloc]init];
    TestTableController *tb4=[[TestTableController alloc]init];
    TestTableController *tb5=[[TestTableController alloc]init];


    self.controllerArr = @[tb1,tb2,tb3,tb4,tb5];

}


@end
