//
//  ViewController.m
//  crontab-ios
//
//  Created by zhuchao on 15/3/9.
//  Copyright (c) 2015年 zhuchao. All rights reserved.
//

#import "ViewController.h"
#import "CronTabCenter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [CronTabCenter addCronJob:@"1 1" forBlock:^{
        NSLog(@"1 1 executed");
    }];
    
    [CronTabCenter  addCronJob:@"2 1" forBlock:^{
        NSLog(@"2 1 executed");
    }];
    
    [CronTabCenter  addCronJob:@"1 *" forBlock:^{
        NSLog(@"1 * executed");
    }];
    
    [CronTabCenter addCronJob:@"2 *" forBlock:^{
        NSLog(@"2 * executed");
    } elseBlock:^{
        NSLog(@"2 * else executed");
    }];
    
    [CronTabCenter addCronJob:@"3" forBlock:^{
        NSLog(@"3 executed");
    }];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
