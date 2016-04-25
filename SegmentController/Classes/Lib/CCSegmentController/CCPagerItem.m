//
//  PagerItem.m
//  SegmentController
//  URL: http://www.xiongcaichang.com
//  Created by bear on 16/4/15.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "CCPagerItem.h"

@interface CCPagerItem ()

@end

@implementation CCPagerItem

-(void)setContent:(UIView *)content{
    _content=content;
    
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.contentView addSubview:content];



}
@end
