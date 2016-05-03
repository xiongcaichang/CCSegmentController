//
//  TestTable.m
//  SegmentController
//
//  Created by bear on 16/4/28.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "TestTable.h"

#import "UIColor+Extension.h"

@interface TestTable ()


@end

@implementation TestTable

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{

    if (self=[super initWithFrame:frame style:style]) {

        self.dataSource=self;
//        self.delegate =self;
    }
    return self;
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

    cell.backgroundColor= [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];


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


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    TestTableController *tb1=[[TestTableController alloc]init];
//    tb1.view.backgroundColor=[UIColor blackColor];


//    NSLog(@"%@",self.navigationController);

//    [self presentViewController:tb1 animated:YES completion:nil];


//[self.navigationController pushViewController:tb1 animated:YES];
}


@end
