//
//  AVplayerLayerVC.m
//  Animation
//
//  Created by WJ on 2017/8/24.
//  Copyright © 2017年 WJ. All rights reserved.
//

#import "AVplayerLayerVC.h"
#import <AVFoundation/AVFoundation.h>

@interface AVplayerLayerVC ()

@end

@implementation AVplayerLayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    [self defaultDemo];
    [self transformDemo];
}

// 给视频增加变换, 边框 圆角
- (void)transformDemo{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"shipin1" withExtension:@"mp4"];
    AVPlayer *player = [AVPlayer playerWithURL:url];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    playerLayer.frame = CGRectMake(0, 100, self.view.bounds.size.width, 200);
    [self.view.layer addSublayer:playerLayer];
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1.0/ 500.0;
    transform = CATransform3DRotate(transform, M_PI_4, 1, 1, 0);
    playerLayer.transform = transform;
    playerLayer.masksToBounds = YES;
    playerLayer.cornerRadius = 20.0;
    
    playerLayer.borderColor = [UIColor blueColor].CGColor;
    playerLayer.borderWidth = 3.0;
    
    
    [player play];
}

// 一般的视频播放
- (void)defaultDemo{
    // 当加载视频路径时出现 URL 为 nil时, 说明 视频文件没有被xcode 自动添加到 资源文件中
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"shipin1" withExtension:@"mp4"];
    AVPlayer *player = [AVPlayer playerWithURL:url];
    
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    playerLayer.frame = self.view.bounds;
    [self.view.layer addSublayer:playerLayer];
    [player play];

}


@end
