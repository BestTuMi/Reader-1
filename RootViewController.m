//
//  RootViewController.m
//  Reader
//
//  Created by z on 16/3/8.
//  Copyright © 2016年 chang. All rights reserved.
//

#import "RootViewController.h"

#import "MyBookShellCell.h"
#import "ReadBooks.h"
#import "Header.h"

@implementation RootViewController

static int cnt;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"迷你小书屋";
    UIImage * backgroundImage = [UIImage imageNamed:@"BookShelfCell@2x.png"];
    UIColor * backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    self.view.backgroundColor = backgroundColor;
    
    CGFloat viewH = SCREEN_HEIGHT;
    CGFloat tViewH = SCREEN_HEIGHT;
    
    //将每本书的封面图片以字符串的形式存取到数组中
    self.dataArray = [[NSMutableArray alloc] initWithObjects:@"aizaixianjingderizi.jpeg",@"anshizhangda.jpeg",@"bubizhidaowoshishui.jpeg",@"dangnigudannihuixiangqishui.jpeg",@"hudielaiguozheshijie.jpeg",@"liaiyigeIDdejuli.jpeg",@"shalou.jpeg",@"shinian.jpeg",@"tangyi.jpeg",@"tiaopin.jpeg",@"wobushinideyuanjia.jpeg",@"woyaowomenzaiyiqi.jpeg",@"xiaofudequnbai.jpeg",@"xiaoyaodejinsechengbao.jpeg",@"zuishuxidemoshengren.jpeg",@"zuoer.jpg",@"zuoerzhongjie.jpeg",@"aizaixianjingderizi.jpeg", nil];
    self.mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
    _mainScrollView.backgroundColor = [UIColor redColor];
    //设置mainScrollView的大小
    _mainScrollView.contentSize = CGSizeMake(2 * SCREEN_WIDTH, SCREEN_HEIGHT);
    _mainScrollView.delegate = self;
    //隐藏水平和垂直滚动条
    _mainScrollView.showsHorizontalScrollIndicator = NO;
    _mainScrollView.showsVerticalScrollIndicator = NO;
    //将分页开关打开
    _mainScrollView.pagingEnabled = YES;
    //静止来回晃动
    _mainScrollView.bounces = NO;
    [self.view addSubview:_mainScrollView];
    
    self.tableViewF = [[UITableView alloc] initWithFrame:CGRectMake(0 , 0,SCREEN_WIDTH,tViewH) style:UITableViewStylePlain];
    _tableViewF.delegate = self;
    _tableViewF.dataSource = self;
    _tableViewF.backgroundColor = [UIColor grayColor];
    [_mainScrollView addSubview:_tableViewF];
    //静止来回晃动
    _tableViewF.bounces = NO;
    _tableViewF.tag = 100;
    
    self.tableViewS = [[UITableView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH ,0,SCREEN_WIDTH,tViewH) style:UITableViewStylePlain];
    _tableViewS.delegate = self;
    _tableViewS.dataSource = self;
    _tableViewS.backgroundColor = [UIColor orangeColor];
    [_mainScrollView addSubview:_tableViewS];
    //静止来回晃动
    _tableViewS.bounces = NO;
    _tableViewS.tag = 200;
}

#pragma mark - UITableView代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 139;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MyBookShellCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (cell == nil) {
        cell = [[MyBookShellCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"ID"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    //如果是第一个表格视图
    if (tableView.tag == 100) {
        for (int i = 0; i < 3; i++) {
            self.button = [UIButton buttonWithType:UIButtonTypeCustom];
            _button.frame = CGRectMake(10 + ((SCREEN_WIDTH - 40) / 3 + 10) * i, 5, (SCREEN_WIDTH - 40) / 3, 119);
            _button.tag = cnt;//将cnt设置成button的tag，方便获取
            [_button setImage:[UIImage imageNamed:[_dataArray objectAtIndex:cnt++]] forState:UIControlStateNormal];
            [_button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:_button];
        }
    }
    //如果是第二个表格视图
    if (tableView.tag == 200) {
        for (int i = 0; i < 3; i++) {
            _button = [UIButton buttonWithType:UIButtonTypeCustom];
            _button.tag = cnt;   //将cnt设置成button的tag，方便获取
            _button.frame = CGRectMake(10 + ((SCREEN_WIDTH - 40) / 3 + 10) * i, 5, (SCREEN_WIDTH - 40) / 3, 119);
            [_button setImage:[UIImage imageNamed:[_dataArray objectAtIndex:cnt++]] forState:UIControlStateNormal];
            [_button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:_button];
        }
    }
    
    return cell;
}

- (void)onClick:(UIButton *)sender{
    ReadBooks * readBook = [[ReadBooks alloc] init];
    if (sender.tag == 0) {
        //获取aizaixianjingderizi.txt里面的内容
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"aizaixianjingderizi" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 1) {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"anshizhangda" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 2) {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bubizhidaowoshishui" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 3) {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"dangnigudannihuixiangqishui" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 4) {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"hudielaiguozheshijie" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 5) {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"liaiyigeIDdejuli" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 6) {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"shalou" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 7) {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"shinian" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 8) {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tangyi" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    
    if (sender.tag == 9) {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tiaopin" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 10) {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"wobushinideyuanjia" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 11) {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"woyaowomenzaiyiqi" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 12) {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"xiaofudequnbai" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 13) {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"xiaoyaodejinsechengbao" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 14) {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"zuishuxidemoshengren" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 15) {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"zuoer" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 16) {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"zuoerzhongjie" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    if (sender.tag == 17) {
        readBook.str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"aizaixianjingderizi" ofType:@"txt" ]encoding:NSUTF8StringEncoding error:nil];
    }
    //设置翻转模式
    [readBook setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentModalViewController:readBook animated:YES];
//    [self.navigationController pushViewController:readBook animated:YES];
    return;
}

@end
