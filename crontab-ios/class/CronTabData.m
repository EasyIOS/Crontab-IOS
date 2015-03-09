//
//  CronTabData.m
//  crontab-ios
//
//  Created by zhuchao on 15/3/9.
//  Copyright (c) 2015年 zhuchao. All rights reserved.
//

#import "CronTabData.h"

@implementation CronTabData

-(id)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super init]){
        self.totalTimes = [aDecoder decodeObjectForKey:@"totalTimes"]?:@0;
        self.totalTimesOfToday = [aDecoder decodeObjectForKey:@"totalTimesOfToday"]?:@0;
        self.totalDays = [aDecoder decodeObjectForKey:@"totalDays"]?:@0;
        self.date = [aDecoder decodeObjectForKey:@"date"]?:@"";
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.totalDays forKey:@"totalDays"];
    [aCoder encodeObject:self.totalTimesOfToday forKey:@"totalTimesOfToday"];
    [aCoder encodeObject:self.totalTimes forKey:@"totalTimes"];
    [aCoder encodeObject:self.date forKey:@"date"];
}

/*!
 *  @brief  Loads the dictionary from User Defaults.
 *  @return the saved dictionary.
 */
+(id)loadFromUserDefaults
{
    /// Load the encoded dictionary from User Defaults and decode it.
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [userDefaults objectForKey:NSStringFromClass([self class])];
    if (data) {
        return [NSKeyedUnarchiver unarchiveObjectWithData:data];
    } else {
        return [[self alloc]initWithCoder:nil];
    }
}

/*!
 *  @brief  Encodes and saves the current dictionary to the User Defaults.
 */
- (void)saveToUserDefaults
{
    /// Encodes and Saves the decoded running dictionary to User Defaults.
    NSData *decodedDictionary = [NSKeyedArchiver archivedDataWithRootObject:self];
    [[NSUserDefaults standardUserDefaults] setObject:decodedDictionary forKey:NSStringFromClass( [self class])];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)increaceNumber{
    
    self.totalTimes = [NSNumber numberWithInt:self.totalTimes.integerValue + 1];
    NSString *currentDate = [self getCurrentDate];
    
    if([self.date isEqualToString:currentDate]){
        self.totalTimesOfToday =  [NSNumber numberWithInt:self.totalTimesOfToday.integerValue + 1];
    }else{
        self.totalTimesOfToday = @1;
        self.date = currentDate;
        self.totalDays = [NSNumber numberWithInt:self.totalDays.integerValue + 1];
    }
    [self saveToUserDefaults];
}

-(NSString *)getCurrentDate{
    NSDate *senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYYMMdd"];
    return [dateformatter stringFromDate:senddate];
}
@end
