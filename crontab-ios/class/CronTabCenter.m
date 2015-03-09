//
//  CronTabCenter.m
//  crontab-ios
//
//  Created by zhuchao on 15/3/9.
//  Copyright (c) 2015年 zhuchao. All rights reserved.
//

#import "CronTabCenter.h"

@implementation CronTabCenter

+(instancetype)shareInstance{
    static dispatch_once_t predicate = 0;
    static id sharedInstance = nil;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init
{
    if ((self = [super init])) {
        /// Load the already tracked executed blocks from UserDefaults.
        self.cronTabData = [CronTabData loadFromUserDefaults];
        [self.cronTabData increaceNumber];
    }
    return self;
}

+(void)addCronJob:(NSString *)cronJob forBlock:(void (^)())block{
    
    if([self shouldExecuteCronJob:cronJob forBlock:block]){
        block();
    }
}

+(void)addCronJob:(NSString *)cronJob forBlock:(void (^)())block elseBlock:(void (^)())elseblock{
    if([self shouldExecuteCronJob:cronJob forBlock:block]){
        block();
    }else{
        elseblock();
    }
}

+(BOOL)shouldExecuteCronJob:(NSString *)cronJob forBlock:(void (^)())block{
    if(block && cronJob && ![cronJob isEqualToString:@""]){
        NSArray * array = [cronJob componentsSeparatedByString:@" "];
        if(array.count ==2){
            NSString *times = [array firstObject];
            NSString *days = [array lastObject];
            
            NSUInteger time = 0;
            BOOL isPerTime = NO;
            NSUInteger day = 0;
            BOOL isPerDay = NO;
            
            if([times componentsSeparatedByString:@"/"].count ==2){  //*/5
                isPerTime = YES;
                time = [[array lastObject] integerValue];
            }else if ([times isEqualToString:@"*"]){  //*
                isPerTime = YES;
            }else{
                time = times.integerValue;
            }
            
            if([days componentsSeparatedByString:@"/"].count ==2){  //*/5
                isPerDay = YES;
                day = [[array lastObject] integerValue];
            }else if ([days isEqualToString:@"*"]){  //*
                isPerDay = YES;
            }else{
                day = days.integerValue;
            }
            return [self isDayValid:day isPerDay:isPerDay] && [self isTimeValid:time isPerTime:isPerTime];
        }else if(array.count == 1){
            if([cronJob isEqualToString:@"*"] || [CronTabCenter shareInstance].cronTabData.totalTimes.integerValue == cronJob.integerValue){
                return YES;
            }
        }
    }
    return NO;
}

+(BOOL)isDayValid:(NSUInteger )day isPerDay:(BOOL)isPerDay{
    if(isPerDay){
        return day == 0 || [CronTabCenter shareInstance].cronTabData.totalDays.integerValue%day == 0;
    }else{
        return [CronTabCenter shareInstance].cronTabData.totalDays.integerValue == day;
    }
}

+(BOOL)isTimeValid:(NSUInteger )time isPerTime:(BOOL)isPerTime{
    if(isPerTime){
        return time == 0 || [CronTabCenter shareInstance].cronTabData.totalTimesOfToday.integerValue%time == 0;
    }else{
        return [CronTabCenter shareInstance].cronTabData.totalTimesOfToday.integerValue == time;
    }
}

@end
