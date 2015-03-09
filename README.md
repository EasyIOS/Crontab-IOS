# Crontab-IOS
___

A light-weight library to execute Objective-C codes only once in app life with a crontab like way. Execute code/blocks only for the first time the app runs, for example.


## Installation

We recommend you to install this project using CocoaPods:

## Installation with CocoaPods

CocoaPods is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like YCFirstTime in your projects.

## Podfile

```
platform :ios, '5.0'
pod "Crontab-IOS"
```
#Usage

> cronRule : times day

```
NSString * cronRule = @"1 1";
[CronTabCenter addCronJob:cronRule forBlock:^{
        NSLog(@"1 1 executed");
    }];
```

* The cronRule is kind of NSString class , and separated By a Space.

* The first number represents the times of the app launch today.

* The second number represents the day of the app launch.

* `@"1 1"` means the first day's first launch，just like for the first time to launch。Use this option, for example, to run a welcome dialog or create a initial database.

* `@"1 *" `  means the every one day's first launch。Use this option, for example,to ask to buy the PRO version every day.

* `@"1 */7" `  means the every seven day's first launch。Use this option, for example,to ask to rate your app every 7 days.

> cronRule : totalTimes

```
NSString * cronRule = @"1";
[CronTabCenter addCronJob:cronRule forBlock:^{
        NSLog(@"1 executed");
    }];
```
* The cronRule is kind of NSString class , and separated By a Space.

* The cronRule number represents the total times of the app launch.

* `@"1"` means the first day's first launch，just like the `@"1 1"`.

* `@"*"` means the first day's first launch，just like the `@"* *"`.

# Example 

This is just a example to show the usage of crontab-ios

```
    
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
```


* When we  launch the app for the first time, it will log the result

```
 1 1 executed
 1 * executed
 2 * else executed
```


* And when we  launch the app for the second time,it will log the result

```
 2 1 executed
 2 * executed
```


* And when we  launch the app for the third time,it will log the result

```
 2 * else executed
 3 executed
```


* And when we  launch the app for the forth time,it will log the result

```
 2 * else executed
```