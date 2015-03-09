//
//  CronTabData.h
//  crontab-ios
//
//  Created by zhuchao on 15/3/9.
//  Copyright (c) 2015年 zhuchao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CronTabData : NSObject <NSCoding>
@property(nonatomic,retain)NSNumber *totalTimes;//总启动次数
@property(nonatomic,retain)NSNumber *totalDays;//总启动天数
@property(nonatomic,retain)NSNumber *totalTimesOfToday;//今日总启动次数
@property(nonatomic,retain)NSString *date;
- (void)increaceNumber;
- (void)saveToUserDefaults;
+ (id)loadFromUserDefaults;
@end
