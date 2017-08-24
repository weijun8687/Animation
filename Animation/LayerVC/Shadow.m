//
//  Shadow.m
//  Animation
//
//  Created by WJ on 16/11/21.
//  Copyright © 2016年 WJ. All rights reserved.
//

#import "Shadow.h"

@interface Shadow ()
@property (nonatomic, strong) UIView *Vgreen;

@end

@implementation Shadow

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.Vgreen = [[UIView alloc] initWithFrame:CGRectMake(40, 40, 160, 160)];
    [self.view addSubview:self.Vgreen];
    self.Vgreen.backgroundColor = [UIColor greenColor];
    
//    UIView *vRed = [[UIView alloc] initWithFrame:CGRectMake(-10, -10, 60, 60)];
//    vRed.backgroundColor = [UIColor redColor];
//    [self.Vgreen addSubview:vRed];
    
    
    // 设置圆角
    self.Vgreen.layer.cornerRadius = 10.0;
    // 超出边界部分切割掉
//    self.Vgreen.layer.masksToBounds = YES;
    
    // 设置边框宽度
//    self.Vgreen.layer.borderWidth = 2.0;
//    // 设置边框颜色
//    self.Vgreen.layer.borderColor = [UIColor blueColor].CGColor;
    
    //  设置阴影的时候 控件的 masksToBounds 属性一定要为NO
    // 设置阴影的透明度 [0-1]
    self.Vgreen.layer.shadowOpacity = 0.5;
    // 设置阴影的偏移量
    self.Vgreen.layer.shadowOffset = CGSizeMake(5, 5);
    // 设置阴影的颜色
    self.Vgreen.layer.shadowColor = [UIColor purpleColor].CGColor;
    // 设置阴影的圆角
    self.Vgreen.layer.shadowRadius = 5.0;
    
    
    
}



@end
