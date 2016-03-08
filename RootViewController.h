//
//  RootViewController.h
//  Reader
//
//  Created by z on 16/3/8.
//  Copyright © 2016年 chang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *mainScrollView;
@property (nonatomic, strong) UITableView *tableViewF;
@property (nonatomic, strong) UITableView *tableViewS;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UIButton *button;

@end
