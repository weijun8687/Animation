//
//  TransformLight.m
//  Animation
//
//  Created by WJ on 2017/8/15.
//  Copyright © 2017年 WJ. All rights reserved.
//  正方体各面的光线效果问题

#import "TransformLight.h"
#import <GLKit/GLKit.h>

#define LIGHT_GIRECTION 0, 1, -0.5
#define AMBIENT_LIGHT 0.5

@interface TransformLight ()
@property (nonatomic, strong) NSMutableArray *arr;

@end


@implementation TransformLight

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    
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
//        v.backgroundColor = [UIColor colorWithRed:(arc4random_uniform(255) / 255.0) green:(arc4random_uniform(255) / 255.0) blue:(arc4random_uniform(255) / 255.0) alpha:1.0];
        
        v.backgroundColor = [UIColor whiteColor];
        
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

- (void)applyLightingToFace:(CALayer *)face{
    CALayer *layer = [CALayer layer];
    layer.frame = face.bounds;
    [face addSublayer:layer];
    
    CATransform3D transform = face.transform;
    // 将 CATransform3D 转换成 GLKMatrix4
    GLKMatrix4 matrix4 = *(GLKMatrix4 *)&transform;
    //将 GLKMatrix4 转换成 GLKMatrix3
    GLKMatrix3 matrix3 = GLKMatrix4GetMatrix3(matrix4);
    
    GLKVector3 normal = GLKVector3Make(0, 0, 1);
    
    normal = GLKMatrix3MultiplyVector3(matrix3, normal);
    normal = GLKVector3Normalize(normal);
    GLKVector3 light = GLKVector3Normalize(GLKVector3Make(LIGHT_GIRECTION));
    float dotProduct = GLKVector3DotProduct(light, normal);
    
    CGFloat shadow = 1 + dotProduct - AMBIENT_LIGHT;
    UIColor *color = [UIColor colorWithWhite:0 alpha:shadow];
    layer.backgroundColor = color.CGColor;
    
}

- (void)addFace:(NSInteger)index withTransform:(CATransform3D)transform{
    UIView *face = self.arr[index];
//    [self.view addSubview:face];
//    
//    CGSize containerSize = self.view.bounds.size;
//    face.center = CGPointMake(containerSize.width / 2.0, containerSize.height / 2.0);
    face.layer.transform = transform;
    [self applyLightingToFace:face.layer];
}

- (NSMutableArray *)arr{
    if (!_arr) {
        _arr = [NSMutableArray array];
    }
    return _arr;
}


@end
