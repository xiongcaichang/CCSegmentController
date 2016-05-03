//
//  TitleCell.m
//  SegmentController
//
//  Created by bear on 16/5/3.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "TitleCell.h"

@interface TitleCell ()


@property (nonatomic, weak) UILabel *titleLabel;


@end

@implementation TitleCell


-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];

    if (self) {
        UILabel *label =[[UILabel alloc]init];
        [self addSubview:label];
        self.titleLabel=label;


    }


    return self;
}



-(void)layoutSubviews{



    [super layoutSubviews];



}
@end
