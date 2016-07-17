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


@interface ViewController ()<UITextFieldDelegate>

@property (nonatomic,strong) NSArray *dataArray;

@property (nonatomic,assign) NSInteger age;

@property (nonatomic,strong) UITextField *testTextField;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    

    [self testThree];
    
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

- (void)testThree
{
    self.testTextField = [[UITextField alloc]initWithFrame:CGRectMake((PhoneScreen_WIDTH-200)/2, 150, 200, 40)];
    self.testTextField.backgroundColor = RGBCOLOR(240, 240, 240, 1.0);
    self.testTextField.text = @"This is just a testString~";
    self.testTextField.delegate = self;
    self.testTextField.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:self.testTextField];
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];

        return NO;
    }else{
        return YES;
    }
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
//    [self showAbandonAlert];
    [self showAlertController];
    
}

//废弃的alertView
- (void)showAbandonAlert
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"结束编辑啦" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
}


//alertController
- (void)showAlertController
{
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"提示" message:@"结束编辑啦" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"确定Action");
    }];
    [controller addAction:action];
    
    [self presentViewController:controller animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
