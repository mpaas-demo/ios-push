//
//  DFCrashReport.h
//  APMobileRuntime
//
//  Created by liangbao.llb on 12/30/14.
//  Copyright (c) 2014 Alipay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <mach/mach.h>

/**
 *  启动APCrashReporter服务
 */
void enable_crash_reporter_service (void);
BOOL registerAbortHandler (NSError **error);

@interface DFCrashReport : NSObject

/**
 *  上传crash日志
 */
+ (void)uploadCrashReport;

/**
 *  获取内存中所有的VC
 *
 *  @return 返回包含所有VC的字符串
 */
+ (NSString *) allAliveVc;

/**
 *  指定Crashed Thread生成闪退日志(base64)
 *
 *  @param tid 指定的Crashed线程id
 *
 *  @return 闪退日志
 */
+ (NSString *)generateMonitorLogWithThread:(thread_t) tid;

/**
 *  指定Crashed Thread生成全栈日志（明文）
 *
 *  @param tid 指定的Crashed线程id
 *
 *  @return 全栈日志
 */
+ (NSString *)generateReadableMonitorLogWithThread:(thread_t) tid;

/**
 *  上次程序退出是否闪退退出
 *
 *  @return BOOL型 YES表示上次程序发生闪退退出，否则反之
 */
+ (BOOL)isCrashedLastTime;

/**
 *  上次程序退出是否是启动闪退
 *
 *  @return BOOL型 YES表示上次程序退出是启动闪退，否则反之
 */
+ (BOOL)isCrashedLastTimeInBootup;

/**
 *  上次程序退出是闪退退出的情况下，返回自动化埋点记录的当前页面， 压后台有特殊值表示; 否则，返回空
 *  
 *  返回值示例：
 *  LifeHomeViewController
 *  enter_background_page_id
 *  https://66666674.h5app.alipay.com/www/index.htm
 *
 *  @return NSString型 页面信息
 */
+ (NSString *)crashedViewId;


/**
 设置启动卡死监听的结束时间点
 @param isFinish 为 YES，监听结束时间点为用户发出启动完成通知; 否则，监听结束时间点为 UIApplicationDidFinishLaunchingNotification 系统通知。
 用户发出的启动完成通知：[ [NSNotificationCenter defaultCenter] postNotificationName:@"APMonitor_Startup_Cost_Time" object:nil userInfo:@{@"CostTimeOnUserFeel": [NSString stringWithFormat:@"%f", time]}];

 */
+ (void)setUserFeelLaunchFinish:(BOOL)isFinish;

/**
 获取 setUserFeelLaunchFinish: 方法设置的卡死启动监控结束时间点，SDK 内部使用。
 */
+ (BOOL)isUserFeelLaunchFinish;

/**
 *标识将要调用SyncHotpatchTask
 */
+ (void)setSyncTaskStart:(BOOL)start;

+ (BOOL)isSyncTaskStart;

@end
