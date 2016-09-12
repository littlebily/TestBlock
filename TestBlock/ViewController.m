//
//  ViewController.m
//  TestBlock
//
//  Created by Bolu on 16/8/31.
//  Copyright © 2016年 Bolu. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //基本数据类型
    //在block里为什么要使用__block才可以访问变量multiplier？
    __block int multiplier = 7;
    int (^myBlock)(int) = ^(int num) {
        multiplier ++;//这样就可以了
        NSLog(@"multiplier--blockIn--内存地址：%p，变量值：%d", &multiplier, multiplier);
        return num * multiplier;
    };
    
    NSLog(@"multiplier--blockOut1--内存地址：%p，变量值：%d", &multiplier, multiplier);
    NSLog(@"myBlock--%d", myBlock(7));
    NSLog(@"multiplier--blockOut2--内存地址：%p，变量值：%d", &multiplier, multiplier);    

    NSMutableArray *mArray = [NSMutableArray arrayWithObjects:@"a",@"b",@"abc",nil];
    NSMutableArray *mArrayCount = [NSMutableArray arrayWithCapacity:1];
    [mArray enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock: ^(id obj, NSUInteger idx, BOOL *stop){
        [mArrayCount addObject:[NSNumber numberWithInt:(int)[obj length]]];
    }];
    
    NSLog(@"mArrayCount--%@",mArrayCount);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    ViewController2 *vc = [[ViewController2 alloc] init];
    // 回调修改颜色
    vc.backgroundColor = ^(UIColor *color){
        self.view.backgroundColor = color;
    };
    
    vc.view.frame = CGRectMake(0, 300, 100, 100);
    vc.view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:vc.view];
}

@end
