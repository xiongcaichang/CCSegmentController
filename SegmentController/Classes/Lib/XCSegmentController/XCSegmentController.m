//
//  SegmentController.m
//  SegmentController
//
//  Created by bear on 16/4/15.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "XCSegmentController.h"
#import "XCPagerItem.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define SELECTED_COLOR [UIColor redColor]

#define KTitleH 30


static NSString *ID=@"pager";

@interface XCSegmentController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UIView *titleWrap;

@property (nonatomic, assign) CGFloat titleHeight;

@property (nonatomic, strong) NSMutableArray *itemArr;

@property (nonatomic, weak) UIView *sliderView;


@property (nonatomic, assign) NSInteger oldSelectedIndex;
@property (nonatomic, assign) NSInteger selectedIndex;

@property (nonatomic, strong) UICollectionView *pagerContainer;


@end

@implementation XCSegmentController

- (void)viewDidLoad {
    [super viewDidLoad];


}

-(void)setTitleArr:(NSArray *)titleArr{
    _titleArr = titleArr;

    [self initTitleWrap];

}

-(void)setControllerArr:(NSArray *)controllerArr{
    _controllerArr=controllerArr;
     [self initPagerContainer];
}

-(void)initTitleWrap{
    CGFloat itemW = (CGFloat)SCREEN_WIDTH/_titleArr.count;
    //标题容器
    UIView *titleWrap = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, KTitleH)];
    titleWrap.backgroundColor = [UIColor grayColor];
    [self.view addSubview:titleWrap];
    _titleWrap = titleWrap;

    _itemArr = [NSMutableArray array];
    for (int i = 0; i < self.titleArr.count; i++) {
        UIButton *itemButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [itemButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [itemButton setTitle:_titleArr[i] forState:UIControlStateNormal];
//        [itemButton setTitleColor:SELECTED_COLOR forState:UIControlStateSelected];
        [itemButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
        itemButton.frame = CGRectMake(itemW*i, 0, itemW, KTitleH);
        itemButton.tag = i;
        [itemButton addTarget:self action:@selector(scrollToSelectedIndex:) forControlEvents:UIControlEventTouchUpInside];
        [titleWrap addSubview:itemButton];

        [_itemArr addObject:itemButton];
    }

    //添加滑块
    UIView *sliderV=[[UIView alloc]initWithFrame:CGRectMake(0, KTitleH-2, itemW, 2)];
    sliderV.backgroundColor=SELECTED_COLOR;
    [self.titleWrap addSubview:sliderV];
    _sliderView=sliderV;

    [self scrollToSelectedIndex:self.itemArr[0]];
}



-(void)initPagerContainer{

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;


    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, KTitleH, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:layout];

    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
    _pagerContainer = collectionView;
    collectionView.pagingEnabled = YES;
    collectionView.bounces = NO;
    collectionView.backgroundColor=[UIColor whiteColor];
    collectionView.showsVerticalScrollIndicator=YES;
    [collectionView registerClass:[XCPagerItem class] forCellWithReuseIdentifier:ID];
    
    
}


-(void)scrollToSelectedIndex:(UIButton *) item{


    [self selectButton:item.tag];

    //滚动到选中页面
    [UIView animateWithDuration:0.3 animations:^{
        self.pagerContainer.contentOffset = CGPointMake(SCREEN_WIDTH*item.tag, 0);

    }];

    //保存选中索引
    self.oldSelectedIndex = item.tag;

}


//监听滚动事件判断当前拖动到哪一个了
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

   NSInteger index = scrollView.contentOffset.x / SCREEN_WIDTH;
    [self selectButton:index];

}


//选中按钮的处理
-(void)selectButton:(NSInteger )index{
    //取消选中上一个
    [self.itemArr[self.oldSelectedIndex] setSelected:NO];
    //选中当前
    [self.itemArr[index] setSelected:YES];

    CGFloat itemW = (CGFloat)SCREEN_WIDTH/_titleArr.count;
    [UIView animateWithDuration:0.2 animations:^{

        self.sliderView.frame=CGRectMake(itemW*index, KTitleH-2, itemW, 2);
        [[self.itemArr[_oldSelectedIndex] titleLabel] setFont:[UIFont systemFontOfSize:14]];
        [[self.itemArr[index] titleLabel] setFont:[UIFont systemFontOfSize:20]];
    }];

    
    //记录当前选中
    self.oldSelectedIndex = index;




}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.controllerArr.count;
}



-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

     XCPagerItem  *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];

    UITableViewController *tableVc = self.controllerArr[indexPath.item];


    //判断是否有导航栏来确定内容的高度
    if (self.navigationController.navigationBar) {

        tableVc.view.frame=CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-KTitleH);
    }else{
        tableVc.view.frame=CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-KTitleH);
    }
    cell.content = tableVc.view;

    return cell;

}




@end
