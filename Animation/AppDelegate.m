//
//  AppDelegate.m
//  Animation
//
//  Created by WJ on 16/11/11.
//  Copyright © 2016年 WJ. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"  // 钟表
#import "ZPositionVC.h"     // 
#import "TouchInLayer.h"    // 判断点击的layer
#import "Shadow.h"      // 阴影
#import "ShadowPath.h"  // 阴影
#import "TransformViewController.h" // 旋转
#import "3DTransform.h"     // 旋转正方体
#import "TransformLight.h"      // 有明暗度的正方体(没实现)
#import "DrawingViewController.h"   // 画小人 / 一个直角的正方形
#import "TransformLayerVC.h"    // 旋转正方体
#import "GradientLayrVC.h"      // 颜色渐变
#import "ReplicatorLayerVC.h"   // 复用layer
#import "EmitterLayerVC.h"
#import "EaglLayerVC.h"
#import "AVplayerLayerVC.h"
#import "TransactionVC.h"
#import "KeyFrameAnimationVC.h"
#import "AnimationGroupVC.h"
#import "StopAnimation.h"
#import "PanGestureVC.h"
#import "MediaTimingFunctionVC.h"
#import "BallAnimationVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [BallAnimationVC new];
    [self.window makeKeyAndVisible];
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
