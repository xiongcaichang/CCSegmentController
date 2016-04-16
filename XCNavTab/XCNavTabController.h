//
//  TabController.h
//  Myproject
//
//  Created by bear on 15/11/22.
//  Copyright © 2015年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XCTabBar.h"

//#define  XCTabBarNotifacationIsHiden @"XCTabBarHiden"

//
//@"VC": [[TableController alloc]init],
//@"ICONOR":@"icon_classTable",
//@"ICONSE":@"icon_classTable_selected",
//@"TITLE":@"表"


#define VIEWCONTROLLER @"VC"

#define NORMAL_ICON @"ICONOR"

#define  SELECTED_ICON @"ICONSE"

#define TITLE @"TITLE"


@interface XCNavTabController :UITabBarController{
    @public

    XCTabBar *_tabBar;
}


@property (nonatomic, strong) NSArray *childControllerAndIconArr;

@end
