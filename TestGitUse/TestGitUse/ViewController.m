//
//  ViewController.m
//  TestGitUse
//
//  Created by WQL on 16/7/8.
//  Copyright © 2016年 WQL. All rights reserved.
//

#import "ViewController.h"

#define PhoneScreen_HEIGHT [UIScreen mainScreen].bounds.size.height
#define PhoneScreen_WIDTH [UIScreen mainScreen].bounds.size.width
#define RGBCOLOR(r,g,b,_alpha) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:_alpha]


@interface ViewController ()

@property (nonatomic,strong) NSArray *dataArray;

@property (nonatomic,assign) NSInteger age;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self testTwo];
    
}

- (void)testOne
{
    NSString *testString = @"-1";
    
    NSInteger interValue = [testString integerValue];
    
    if (interValue) {
        NSLog(@"进入判断");
    }
}


- (void)testTwo
{
    UILabel *oldPriceLabel = [[UILabel alloc]initWithFrame:CGRectMake((PhoneScreen_WIDTH-200)/2, 100, 200, 50)];
    oldPriceLabel.backgroundColor = [UIColor lightGrayColor];
    oldPriceLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:oldPriceLabel];
    
    
    NSString *oldPriceString = @"¥ 2016.0716";
    
    NSUInteger length = [oldPriceString length];
    
    //构建attributeString
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:oldPriceString];
    
    //删除线的range
    [attri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(2, length-2)];
    
    //删除线的颜色
    [attri addAttribute:NSStrikethroughColorAttributeName value:RGBCOLOR(243, 16, 36, 1.0) range:NSMakeRange(2, length-2)];
    
    //设置富文本
    [oldPriceLabel setAttributedText:attri];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
