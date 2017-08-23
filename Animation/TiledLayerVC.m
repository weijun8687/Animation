//
//  TiledLayerVC.m
//  Animation
//
//  Created by WJ on 2017/8/23.
//  Copyright © 2017年 WJ. All rights reserved.
//

#import "TiledLayerVC.h"

@interface TiledLayerVC ()<CALayerDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation TiledLayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.scrollView];
    
    CATiledLayer *tiledLayer = [CATiledLayer layer];
    tiledLayer.frame = CGRectMake(0, 0, 2048, 2048);
    tiledLayer.delegate = self;
    [self.scrollView.layer addSublayer:tiledLayer];
    self.scrollView.contentSize = tiledLayer.frame.size;
    
    
}

// 可以在多个线程中同时并发调用 确保实现的绘制代码是线程安全的
- (void)drawLayer:(CATiledLayer *)layer inContext:(CGContextRef)ctx{
    CGRect bounds = CGContextGetClipBoundingBox(ctx);
    NSInteger x = floor(bounds.origin.x / layer.tileSize.width);
    NSInteger y = floor(bounds.origin.y / layer.tileSize.height);
    NSString *imageName = [NSString stringWithFormat:@"h_%02li_%02li", (long)x, (long)y];
    NSString *imagepath = [[NSBundle mainBundle] pathForResource:imageName ofType:@"jpg"];
    UIImage *titleImage = [UIImage imageWithContentsOfFile:imagepath];
    
    UIGraphicsPushContext(ctx);
    [titleImage drawInRect:bounds];
    UIGraphicsPopContext();
}


@end
