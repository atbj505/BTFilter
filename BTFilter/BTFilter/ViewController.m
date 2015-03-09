//
//  ViewController.m
//  BTFilter
//
//  Created by Robert on 15/3/9.
//  Copyright (c) 2015年 NationSky. All rights reserved.
//

#import "ViewController.h"
#import "BTFilter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[BTFilter shareBTFilter] keyWordWriteWithArray:@[@"啊",@"吧",@"辞",@"的",@"饿"]];
    NSString *result1 = [[BTFilter shareBTFilter] filterWithString:@"啊吧辞的饿风哈哈好"];
    NSString *result2 = [[BTFilter shareBTFilter] filterWithString:@"风哈哈好啊吧辞的饿"];
    NSLog(@"%@,%@",result1,result2);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
