//
//  ViewController2.m
//  TestBlock
//
//  Created by Bolu on 16/8/31.
//  Copyright © 2016年 Bolu. All rights reserved.
//

#import "ViewController2.h"

@implementation ViewController2

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //声明一个颜色
    UIColor *color = [UIColor redColor];
    //用刚刚声明的那个Block去回调修改上一界面的背景色
    self.backgroundColor(color);
}

@end
