//
//  ViewController.m
//  EmptyDataSetManagerDemo
//
//  Created by 仁和Mac on 2018/10/31.
//  Copyright © 2018年 AbelZ. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


- (IBAction)presentTableView:(UIButton *)sender {
    SecondViewController *secondV = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondV animated:YES];
}


@end
