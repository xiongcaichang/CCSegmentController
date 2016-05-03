//
//  MySegmentController.m
//  SegmentController
//  URL: http://www.xiongcaichang.com
//  Created by bear on 16/4/16.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "MySegmentController.h"
#import "TestTable.h"

@interface MySegmentController ()

@end

@implementation MySegmentController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.titleArr = @[@"首页",@"小说",@"视频",@"旅游",@"文化"];

    TestTable  *tb1=[[TestTable  alloc]init];
    TestTable  *tb2=[[TestTable  alloc]init];
    TestTable  *tb3=[[TestTable  alloc]init];
    TestTable  *tb4=[[TestTable  alloc]init];
    TestTable  *tb5=[[TestTable  alloc]init];


    self.tableViewArr = @[tb1,tb2,tb3,tb4,tb5];

}


@end
