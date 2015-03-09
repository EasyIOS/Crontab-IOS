//
//  CronTabCenter.h
//  crontab-ios
//
//  Created by zhuchao on 15/3/9.
//  Copyright (c) 2015年 zhuchao. All rights reserved.
//
// 今日次数      天数
//  1           *       每天第一次
//  1           1       第一天 第一次(首次启动)
//  */5         */5     每五天的 每五次

#import <Foundation/Foundation.h>
#import "CronTabData.h"

@interface CronTabCenter : NSObject
@property(nonatomic,retain)CronTabData *cronTabData;
+(instancetype)shareInstance;
+(void)addCronJob:(NSString *)cronJob forBlock:(void (^)())block;
+(void)addCronJob:(NSString *)cronJob forBlock:(void (^)())block elseBlock:(void (^)())elseblock;
@end
