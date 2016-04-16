//
//  PagerItem.m
//  SegmentController
//
//  Created by bear on 16/4/15.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "CCPagerItem.h"

@interface CCPagerItem ()

@property (nonatomic, weak) UIView *oldContent;


@end

@implementation CCPagerItem

-(void)setContent:(UIView *)content{
    _content=content;

    [self.oldContent removeFromSuperview];
    [self.contentView addSubview:content];
    self.oldContent=content;


}
@end
