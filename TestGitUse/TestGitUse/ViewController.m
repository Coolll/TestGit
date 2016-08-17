//
//  ViewController.m
//  TestGitUse
//
//  Created by WQL on 16/7/8.
//  Copyright © 2016年 WQL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self testThread];
//    [self testOperation];
    
    [self testOperationQueue];
    
    
    //1,1,2,3,5,8,13,21,34,55,89,144,233,
    NSInteger value = [self getValueAtIndex:10];
    NSLog(@"value:%ld",value);

}


- (NSInteger)getValueAtIndex:(NSInteger)index
{
    if (index == 0) {
        return 1;
    }else if (index == 1){
        return 1;
    }else{
        
        return [self getValueAtCurrentIndex:1 needIndex:index currentValue:1 lastValue:1];
    }
}


- (NSInteger)getValueAtCurrentIndex:(NSInteger)currentIndex needIndex:(NSInteger)needIndex currentValue:(NSInteger)currentValue lastValue:(NSInteger)lastValue
{
    if (currentIndex == needIndex-1) {
        return currentValue+lastValue;
    }else{
        return [self getValueAtCurrentIndex:currentIndex+1 needIndex:needIndex currentValue:currentValue+lastValue lastValue:currentValue];
    }
}


- (void)testThread
{
    //创建线程
    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(printString) object:nil];
    
    //设置线程名字
    [thread setName:@"FirstThread"];
    
    //启动线程
    [thread start];
    
    
    //创建线程，并自动启动
    [NSThread detachNewThreadSelector:@selector(printString) toTarget:self withObject:nil];
    
}

- (void)testOperation
{
    //创建operation对象
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
       //该block在当前线程中执行
        NSLog(@"operationBlockThread:%@",[NSThread currentThread]);
        
    }];
    
    //要在start之前添加,该block在一个新的线程中异步执行
    [operation addExecutionBlock:^{
        NSLog(@"addOneBlockThread:%@",[NSThread currentThread]);
    }];
    
    //要在start之前添加，该block在另一个新的线程中异步执行
    [operation addExecutionBlock:^{
        NSLog(@"addTwoBlockThread:%@",[NSThread currentThread]);
    }];
    
    //开始任务
    [operation start];
}

- (void)testOperationQueue
{
    //任务一
    NSBlockOperation *operationOne = [NSBlockOperation blockOperationWithBlock:^{
       
        NSLog(@"oneThread:%@",[NSThread currentThread]);

    }];
    
    //任务二
    NSBlockOperation *operationTwo = [NSBlockOperation blockOperationWithBlock:^{
       
        NSLog(@"twoThread:%@",[NSThread currentThread]);

    }];
    
    //任务三
    NSBlockOperation *operationThree = [NSBlockOperation blockOperationWithBlock:^{
       
        NSLog(@"threeThread:%@",[NSThread currentThread]);

    }];
    
    
    //创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    
    //最大的并发数
    [queue setMaxConcurrentOperationCount:2];
    
    //加入任务
    [queue addOperations:@[operationOne,operationTwo,operationThree] waitUntilFinished:NO];
    
}

- (void)printString
{
    NSLog(@"GOGOGO");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
