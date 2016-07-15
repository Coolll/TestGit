//
//  ViewController.m
//  TestGitUse
//
//  Created by WQL on 16/7/8.
//  Copyright © 2016年 WQL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) NSArray *dataArray;

@property (nonatomic,assign) NSInteger age;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    NSString *testString = @"-1";
    
    NSInteger interValue = [testString integerValue];
    
    if (interValue) {
        NSLog(@"进入判断");
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
