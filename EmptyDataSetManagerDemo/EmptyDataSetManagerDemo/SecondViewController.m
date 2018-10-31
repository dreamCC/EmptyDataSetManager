//
//  SecondViewController.m
//  EmptyDataSetManagerDemo
//
//  Created by 仁和Mac on 2018/10/31.
//  Copyright © 2018年 AbelZ. All rights reserved.
//

#import "SecondViewController.h"
#import "EmptyDataSetManager.h"
#import "UIScrollView+EmptyDataSet.h"

@interface SecondViewController ()<UITableViewDelegate,UITableViewDataSource> {
    EmptyDataSetManager *_emptyManager;
}

@property(nonatomic,strong) NSMutableArray *mAry;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"--viewDidLoad");
    
    /*
     实际开发中，要根据需求来实现。
     一般情况下流程：
     1、进入带有tableView的界面，开始进行网络请求。此时：一般显示customView。设置为加载提示（demo中设置的全局的UIActivityIndicatorView，当然也可以自定义）。注意showCustomView = YES；
     2-1、网络请求成功。此时隐藏customView。showCustomView = NO；
            同时[tableview reloadEmptyDataSet];
               [tableview reloadData]; 不管服务器返回的数据是否为空，都没问题。有数据显示数据，没数据就是显示emptyDateSet。
     2-2、网络请求失败。此时隐藏customView。showCustomView = NO；
          但是失败的原因很多。这就需要根据实际需求来实现。比如如果error.code == -1009 这种情况下是无网络。
          我们只需要 [manager updateEmptyDataSetImage:[UIImage imageNamed:@"no_network"]
                                                title:@"无网络"
                                                message:@"查看详情->->"
                                                buttonTitle:@"重写加载数据"];
          或者显示别的原因等。
     
     如果我们理解DZNEmptyDataSet的工作原理，那么理解起来可能跟容易些。
     */
    self.mAry = [NSMutableArray array];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    __weak typeof(self)weakSelf = self;
    EmptyDataSetManager *emptyManager = [[EmptyDataSetManager alloc] init];
    
    emptyManager.emptyDataSetTapView = ^(UITableView * _Nonnull scrollView, UIView * _Nonnull tapView, EmptyDataSetManager * _Nonnull manager) {

        manager.showCustomView = !manager.isShowingCustomView;

        [manager updateEmptyDataSetImage:[UIImage imageNamed:@"no_network"] title:@"无网络" message:@"查看详情->->" buttonTitle:@"重写加载数据"];
        manager.titleAttibutes = @{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont systemFontOfSize:14]};
        [scrollView reloadEmptyDataSet];
        
        
    };
    
    emptyManager.emptyDataSetTapButton = ^(__kindof UITableView * _Nonnull scrollView, UIButton * _Nonnull button, EmptyDataSetManager * _Nonnull manager) {
        
        for (int i = 0, count = 20; i < count; i++) {
            NSMutableString *mString = [NSMutableString string];
            [mString appendString:@"CocoaChina_让移动开发更简单!!"];
            [weakSelf.mAry addObject:mString];
        }
        [scrollView reloadEmptyDataSet];
        [scrollView reloadData];
    };
    _emptyManager = emptyManager;
    
    UITableView *tableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - 64) style:UITableViewStylePlain];
    tableV.delegate = self;
    tableV.dataSource = self;
    tableV.tableFooterView = [UIView new];
    tableV.emptyDataSetSource = emptyManager;
    tableV.emptyDataSetDelegate = emptyManager;
    tableV.rowHeight = 50;
    [self.view addSubview:tableV];
    [tableV registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
   
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.mAry.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    cell.textLabel.text = self.mAry[indexPath.row];
    return cell;
}



@end
