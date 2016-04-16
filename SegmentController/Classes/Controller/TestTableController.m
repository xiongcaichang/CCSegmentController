//
//  TestTableController.m
//  SegmentController
//
//  Created by bear on 16/4/15.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "TestTableController.h"
#import "UIColor+Extension.h"

@interface TestTableController ()

@end

@implementation TestTableController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.tableView.tableFooterView=[[UITableViewHeaderFooterView alloc]init];


}





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 15;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {


    static NSString *ID=@"testID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }

    cell.textLabel.text=@"testLabel";
    cell.imageView.image=[self imageFromColor:[UIColor colors][arc4random()%8]];
//    cell.backgroundColor=[UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];;

    return cell;
}



//通过颜色来生成一个纯色图片
- (UIImage *)imageFromColor:(UIColor *)color{

    CGRect rect = CGRectMake(0, 0, 100, 100);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
