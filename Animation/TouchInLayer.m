//
//  TouchInLayer.m
//  Animation
//
//  Created by WJ on 16/11/20.
//  Copyright © 2016年 WJ. All rights reserved.
//

#import "TouchInLayer.h"

@interface TouchInLayer ()

@property (nonatomic, strong) UIView *Vgreen;
@property (nonatomic, strong) CALayer *layRed;

@end

@implementation TouchInLayer

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    self.Vgreen = [[UIView alloc] initWithFrame:CGRectMake(40, 40, 160, 160)];
    [self.view addSubview:self.Vgreen];
    self.Vgreen.backgroundColor = [UIColor greenColor];
    
    self.layRed = [CALayer layer];
    self.layRed.frame = CGRectMake(40, 40, 80, 80);
    [self.Vgreen.layer addSublayer:self.layRed];
    self.layRed.backgroundColor = [UIColor redColor].CGColor;

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self.view];
    
    // 返回的是在 self.view.layer 视图上的所有控件 包含改点最近的视图
    CALayer *layer = [self.view.layer hitTest:point];
    
    if (layer == self.Vgreen.layer) {
        [[[UIAlertView alloc] initWithTitle:@"提示" message:@"点到了绿色控件上" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];

    }else if (layer == self.layRed){
        [[[UIAlertView alloc] initWithTitle:@"提示" message:@"点到了红色控件上" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];

    }else{
        [[[UIAlertView alloc] initWithTitle:@"提示" message:@"没有点到任何控件上" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];

    }
    
}


@end
