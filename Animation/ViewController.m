//
//  ViewController.m
//  Animation
//
//  Created by WJ on 16/11/11.
//  Copyright © 2016年 WJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *ivHour;      // 时
@property (nonatomic, strong) IBOutlet UIImageView *ivMinute;    // 分
@property (nonatomic, strong) IBOutlet UIImageView *ivSecound;   // 秒

@property (nonatomic, strong) NSTimer *time;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.ivHour.layer.anchorPoint = CGPointMake(0.5, 0.9);
    self.ivMinute.layer.anchorPoint = CGPointMake(0.5, 0.9);
    self.ivSecound.layer.anchorPoint = CGPointMake(0.5, 0.9);
    
    if (!self.time) {
        self.time = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
            [self trik];
        }];
    }
    
    [self trik];
}

- (void)trik{
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    NSUInteger units = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];
    
    CGFloat hoursAngle = (components.hour / 12.0) * M_PI * 2.0;
    CGFloat minuteAngle = (components.minute / 60.0) * M_PI * 2.0;
    CGFloat secondAngle = (components.second / 60.0) * M_PI * 2.0;
    
    self.ivHour.transform = CGAffineTransformMakeRotation(hoursAngle);
    self.ivMinute.transform = CGAffineTransformMakeRotation(minuteAngle);
    self.ivSecound.transform = CGAffineTransformMakeRotation(secondAngle);
}



@end
