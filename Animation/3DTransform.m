//
//  3DTransform.m
//  Animation
//
//  Created by WJ on 2017/8/15.
//  Copyright © 2017年 WJ. All rights reserved.
//

#import "3DTransform.h"

@interface _DTransform ()

@property (nonatomic, strong) NSMutableArray *arr;

@end

@implementation _DTransform

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 创建 3D旋转效果
//    [self creatTransform];
    
    // 创建一个立方体
    [self createCube];
    
    
}


// 创建一个正方体
- (void)createCube{
    CGFloat wh = 200.0;
    
    for (int i = 0; i < 6; i++) {
        UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, wh, wh)];
        [self.view addSubview:v];
        CGSize size = self.view.bounds.size;

        v.center = CGPointMake(size.width / 2.0, size.height/2.0);
        random();
        
        v.backgroundColor = [UIColor colorWithRed:(arc4random_uniform(255) / 255.0) green:(arc4random_uniform(255) / 255.0) blue:(arc4random_uniform(255) / 255.0) alpha:1.0];
        
        UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
        [v addSubview:lb];
        
        
        lb.center = CGPointMake(wh / 2.0, wh/ 2.0);
        lb.font = [UIFont systemFontOfSize:14.0];
//        [lb sizeToFit];
        lb.text = [NSString stringWithFormat:@"%d", i];
        lb.textAlignment = NSTextAlignmentCenter;
        lb.textColor = [UIColor redColor];
        
        [self.arr addObject:v];
    }
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1.0 / 500.0;
    transform = CATransform3DRotate(transform, -M_PI_4, 1, 0, 0);
    transform = CATransform3DRotate(transform, -M_PI_4, 0, 1, 0);
    self.view.layer.sublayerTransform = transform;
    
    CATransform3D trans;
    trans = CATransform3DMakeTranslation(0, 0, 100);
    [self addFace:0 withTransform:trans];
            
    trans = CATransform3DMakeTranslation(100, 0, 0);
    trans = CATransform3DRotate(trans, M_PI_2, 0, 1, 0);
    [self addFace:1 withTransform:trans];

    trans = CATransform3DMakeTranslation(0, -100, 0);
    trans = CATransform3DRotate(trans, M_PI_2, 1, 0, 0);
    [self addFace:2 withTransform:trans];

    trans = CATransform3DMakeTranslation(0, 100, 0);
    trans = CATransform3DRotate(trans, -M_PI_2, 1, 0, 0);
    [self addFace:3 withTransform:trans];

    trans = CATransform3DMakeTranslation(-100, 0, 0);
    trans = CATransform3DRotate(trans, -M_PI_2, 0, 1, 0);
    [self addFace:4 withTransform:trans];

    trans = CATransform3DMakeTranslation(0, 0, -100);
    trans = CATransform3DRotate(trans, M_PI, 0, 1, 0);
    [self addFace:5 withTransform:trans];

}

- (void)addFace:(NSInteger)index withTransform:(CATransform3D)transform{
    UIView *tempV = self.arr[index];
    tempV.layer.transform = transform;
}

- (NSMutableArray *)arr{
    if (!_arr) {
        _arr = [NSMutableArray array];
    }
    return _arr;
}



// 创建一个 3D 旋转 效果
- (void)creatTransform{
    UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"05"]];
    [self.view addSubview:iv];
    iv.frame = CGRectMake(40, 80, 100, 60);
    
    UIImageView *iv1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"05"]];
    [self.view addSubview:iv1];
    iv1.frame = CGRectMake(200, 80, 100, 60);
    
    CATransform3D transform = CATransform3DIdentity;
    
    // 默认值为0, 可以通过设置 m34 为 -1.0/d 来应用透视效果
    // d 代表 想象中视角相机和屏幕之间的距离, 建议 500-1000
    // 当 m34 的值为0时, 看到的是缩放效果, 没有3D效果
    transform.m34 = -1.0 / 500.0;
    
    // 设置所有子图层的灭点都在屏幕的中点
    self.view.layer.sublayerTransform = transform;
    
    // 绕Y轴旋转
    CATransform3D transform1 = CATransform3DRotate(transform, M_PI, 0, 1, 0);
    
    iv.layer.transform = transform1;
    
    
    CATransform3D transform2 = CATransform3DRotate(transform, -M_PI, 0, 1, 0);
    // CALayer 是双面绘制, 这个属性设置背面是否需要绘制, 默认为yes, 耗费GPU
    iv1.layer.doubleSided = NO;
    iv1.layer.transform = transform2;

}



@end
