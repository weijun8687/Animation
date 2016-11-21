//
//  ZPositionVC.m
//  Animation
//
//  Created by WJ on 16/11/20.
//  Copyright © 2016年 WJ. All rights reserved.
//

#import "ZPositionVC.h"

@interface ZPositionVC ()

@property (nonatomic, strong) UIView *Vgreen;
@property (nonatomic, strong) UIView *Vred;
@property (nonatomic, strong) UIButton *btn;

@end

@implementation ZPositionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.Vgreen = [[UIView alloc] initWithFrame:CGRectMake(40, 40, 80, 80)];
    [self.view addSubview:self.Vgreen];
    self.Vgreen.backgroundColor = [UIColor greenColor];
    
    self.Vred = [[UIView alloc] initWithFrame:CGRectMake(80, 80, 80, 80)];
    [self.view addSubview:self.Vred];
    self.Vred.backgroundColor = [UIColor redColor];
    
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.btn];
    self.btn.frame = CGRectMake(150, 200, 100, 40);
    [self.btn setTitle:@"设置" forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)click{
    // 设置 Vgreen 视图在Z轴上的坐标 (默认为 0)  显示的效果为 Vgreen视图在前面显示
    self.Vgreen.layer.zPosition = 0.1;

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self.view];
    
    // 将点击的点的坐标从self.view.layer 上转换到 self.Vgreen.layer 上
    point = [self.Vgreen.layer convertPoint:point fromLayer:self.view.layer];
    
    [self contentPoint:point];
    

    
    
}


// 使用 containsPoint 方法来判断 点 是否在某图层上
- (void)contentPoint:(CGPoint)point{
    if ([self.Vgreen.layer containsPoint:point]) {
        [[[UIAlertView alloc] initWithTitle:@"提示" message:@"点到了绿色控件上" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
    }else{
        point = [self.Vred.layer convertPoint:point fromLayer:self.Vgreen.layer];
        
        if ([self.Vred.layer containsPoint:point]) {
            [[[UIAlertView alloc] initWithTitle:@"提示" message:@"点到了红色控件上" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
            
        }else{
            [[[UIAlertView alloc] initWithTitle:@"提示" message:@"没有点到任何控件上" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
            
        }
        
    }
}



@end
