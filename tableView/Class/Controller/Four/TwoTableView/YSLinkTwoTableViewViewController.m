//
//  YSLinkTwoTableViewViewController.m
//  tableView
//
//  Created by 李晓龙 on 2018/5/31.
//  Copyright © 2018年 李晓龙. All rights reserved.
//

#import "YSLinkTwoTableViewViewController.h"

@interface YSLinkTwoTableViewViewController ()<UITableViewDelegate,UITableViewDataSource>
/** 左边表格 */
@property (nonatomic ,strong) UITableView  *leftTabele;
/** 右边表格 */
@property (nonatomic ,strong) UITableView  *rightTable;
/** 左边表格数据 */
@property (nonatomic ,strong) NSMutableArray  *leftArray;
/** 右边表格数据 */
@property (nonatomic ,strong) NSMutableDictionary  *rightDictionary;
/** 右边表格keys */
@property (nonatomic ,strong) NSMutableArray  *rightAllKeys;
/** 右边array */
@property (nonatomic ,strong) NSMutableArray  *rightArray;
/** 判断向上还是向下 */
@property (nonatomic ,assign) BOOL isScrollDown;
/** 判断是否是点击 */
@property (nonatomic ,assign) NSInteger  selectIndex;


@end

@implementation YSLinkTwoTableViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self config];
    [self configData];
    
    
    
}

/**
 *  行为
 */

#pragma mark - 生命周期

#pragma mark - 重写

#pragma mark - 初始化

#pragma mark - 方法
-(void)config{
    UITableView *leftTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.w * 0.25, self.view.h) style:(UITableViewStylePlain)];
    UITableView *rightTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.view.w*0.25, 64, self.view.w * 0.75, self.view.h) style:(UITableViewStyleGrouped)];
    
    
    leftTableView.dataSource = self;
    leftTableView.delegate = self;
    
    rightTableView.dataSource = self;
    rightTableView.delegate = self;
    
    self.leftTabele = leftTableView;
    self.rightTable = rightTableView;
    
    [self.view addSubview:self.leftTabele];
    [self.view addSubview:self.rightTable];
    
}

-(void)configData{
    NSMutableDictionary * dict = [NSMutableDictionary new];
    
    
    for (int i = 0; i<100; i++)
    {
        int n1 = arc4random()%26+97;
        int n2 = arc4random()%26+97;
        int n3 = arc4random()%26+97;
        int n4 = arc4random()%26+97;
        int n5 = arc4random()%26+97;
        //获得字符串
        NSString * str = [NSString stringWithFormat:@"%c%c%c%c%c",n1,n2,n3,n4,n5];
        
        //获得第一个字母，其实n1就是
        char ch = [str characterAtIndex:0];
        NSString * str01 = [NSString stringWithFormat:@"%c",ch-32];
        //从字典中获得关键字的集合
        NSArray * arr = [dict objectForKey:str01];
        //构建一个集合
        //NSArray * arr;
        NSMutableArray * array;
        //如果数组为空，则构建出来
        if (arr == nil)
        {
            //用这个字符串把集合创建出来
            arr = [NSArray arrayWithObject:str];
            //NSLog(@"test02=%@",arr);
            //构建动态数组
            array = [NSMutableArray arrayWithArray:[arr sortedArrayUsingSelector:@selector(compare:)]];
        }
        //不为空，直接添加
        else
        {
            //用已有集合合成一个动态数组
            array = [NSMutableArray arrayWithArray:arr];
            //把字符串添加进去
            [array addObject:str];
            
            array = [NSMutableArray arrayWithArray:[array sortedArrayUsingSelector:@selector(compare:)]];
            
        }
        [dict setObject:array forKey:str01];
    }
    
    self.rightDictionary = [NSMutableDictionary new];
    self.rightDictionary = [NSMutableDictionary dictionaryWithDictionary:dict];
    
    
    self.rightAllKeys = [NSMutableArray new];
    self.rightAllKeys = [NSMutableArray arrayWithArray:[[self.rightDictionary allKeys] sortedArrayUsingSelector:@selector(compare:)]];
//    self.rightAllKeys = [NSMutableArray arrayWithArray:[self.rightDictionary allKeys]];
    
    self.leftArray = [NSMutableArray arrayWithArray:self.rightAllKeys];
    
    NSLog(@"arr = %@",self.leftArray);
    NSLog(@"dic = %@",self.rightDictionary);
}

// 字典排序


#pragma mark - 事件

#pragma mark - 网络请求

#pragma mark - 数据源

#pragma mark - tableView代理方法

// 返回分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (tableView == _leftTabele) {
        return 1;
    }else {
        
        return _rightAllKeys.count;
    }
}
// 返回行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (tableView == _leftTabele) {
        return _leftArray.count;
    }else{
        NSString *str = self.rightAllKeys[section];
        NSArray *arr = [self.rightDictionary mutableArrayValueForKey:str];
        return arr.count;
    }
}

// 返回头
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (tableView == _leftTabele) {
        return NULL;
    }else{
        return self.rightAllKeys[section];
    }
}
// 返回cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == _leftTabele) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kPlaceHolderCellId];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:kPlaceHolderCellId];
        }
        cell.textLabel.text = self.leftArray[indexPath.row];
        return cell;
    }
    else{
        TwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kPlaceHolderCellId2];
        if (cell == nil) {
            cell = [[TwoTableViewCell alloc]initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:kPlaceHolderCellId2];
        }
        NSString *str = self.rightAllKeys[indexPath.section];
        self.rightArray = [self.rightDictionary mutableArrayValueForKey:str];
//        NSLog(@" test =%@",self.rightArray[indexPath.row]);
        cell.nameStr = self.rightArray[indexPath.row];
        return cell;
    }
}

#pragma mark 方法一
// 点击左侧可滚动右侧
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _leftTabele) {
        NSInteger select = indexPath.row;
        [_rightTable scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:select] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
}
// 标记右侧tableVIew是向下滚动还是向上滚动
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == self.leftTabele) return;
    
    static CGFloat lastOffsetY = 0;
    UITableView *tableview = (UITableView *)scrollView;
    if (tableview == _rightTable) {
        _isScrollDown = lastOffsetY < scrollView.contentOffset.y; // 手指向上拖动就为真，向下拖动就为假（界面向上滚动、界面向下滚动）
        lastOffsetY = scrollView.contentOffset.y; // 记录当前y值，向下变大，向上变小
//        NSLog(@"%@",_isScrollDown ? @"1":@"2");
    }
}

// 即将展示头部标题  手指向下拖动的时候才显示这个
-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    // 当前tableView 是右侧的， 滑动方向向下，是用户拖拽产生的滚动
    if ((tableView ==  _rightTable) && !_isScrollDown && _rightTable.dragging) {
        NSLog(@"分区将要显示：%ld",section);
        [self selectRowAtIndexPath:section];
    }
}

// 分区标题展示结束 手指向上滑动的时候显示这个
-(void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section{
    // 当钱tableView 是右侧的，滚动方向是向上，是用户拖拽产生的滚动
    NSLog(@"t2:%d",_rightTable.dragging);
    if ((tableView == _rightTable) && _isScrollDown && _rightTable.dragging) {
        NSLog(@"分区将要隐藏：%ld",section);
        [self selectRowAtIndexPath:section];
    }
}

// 当拖动右边 tableView的时候，处理左边tableView
-(void)selectRowAtIndexPath:(NSInteger)index{
    [_leftTabele selectRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] animated:YES scrollPosition:(UITableViewScrollPositionTop)];
}


/*
#pragma mark 方法二

// 点击左侧可滚动右侧
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _leftTabele) {
        NSInteger select = indexPath.row;
        [_rightTable scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:select] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
}
// 标记右侧tableVIew是向下滚动还是向上滚动
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == self.leftTabele) return;
    
    
    NSLog(@"这里是视图上所有cell：%@",[self.rightTable indexPathsForVisibleRows]);
    NSLog(@"这里是最考上的一个cell:%@",[[self.rightTable indexPathsForVisibleRows] firstObject]);
    
    // 取出显示在 视图 且最靠上 的 cell 的 indexPath
    NSIndexPath *topHeaderViewIndexpath = [[self.rightTable indexPathsForVisibleRows] firstObject];
    
    // 左侧 talbelView 移动到的位置 indexPath
    NSIndexPath *moveToIndexpath = [NSIndexPath indexPathForRow:topHeaderViewIndexpath.section inSection:0];
    
    // 移动 左侧 tableView 到 指定 indexPath 居中显示
    [self.leftTabele selectRowAtIndexPath:moveToIndexpath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}
*/

#pragma mark - Get&Set




@end
