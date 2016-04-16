//
//  PagerItem.m
//  SegmentController
//
//  Created by bear on 16/4/15.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "XCPagerItem.h"

@implementation XCPagerItem

-(void)setContent:(UIView *)content{
    _content=content;


//    content.frame=self.bounds;
    [self.contentView addSubview:content];
}
@end
