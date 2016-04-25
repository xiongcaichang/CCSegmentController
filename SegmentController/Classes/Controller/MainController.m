//
//  MainController.m
//  SegmentController
//  URL: http://www.xiongcaichang.com
//  Created by bear on 16/4/16.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "MainController.h"
#import "MySegmentController.h"

@interface MainController ()

@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.childControllerAndIconArr=@[
                                     @{
                                         VIEWCONTROLLER : [[MySegmentController alloc]init],  //控制器
                                         NORMAL_ICON : @"icon_classTable",                 //正常状态的Icon 名称
                                         SELECTED_ICON : @"icon_classTable_selected",       //选中状态的Icon 名称
                                         TITLE : @"表"                                       //Nav和Tab的标题
                                         }
                                     ];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
