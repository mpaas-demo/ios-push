//
//  PushService.h
//  MTPotal
//
//  Created by yangwei on 2017/10/24.
//  Copyright © 2017年 Alibaba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PushService : NSObject

/**
 *  设备的 deviceToken
 *  注意：会在监听UIApplicationDidFinishLaunchingNotification 通知后去注册deviceToken，接入应用请务必在注册成功的回调didRegisterForRemoteNotificationsWithDeviceToken 中，初始化此值，以便上报到服务端
 *
 */
@property(nonatomic, strong) NSData *deviceToken; // 设备的 deviceToken


/**
 * 设置Push服务的url，需要在sharedService方法之前调用。
 * @param gatewayURL Push服务地址
 * @return
 */
+ (void)setPushGateway:(NSString *)gatewayURL;


+ (instancetype)sharedService;

/**
 *  将设备的deviceToken 与 当前应用的 userId绑定，以支持通过 userId 推送消息
 *  注意：调用此方法，服务端会自动将此设备之前的绑定关系解绑后，再重新绑定当前输入的userid
 *
 *  @param userId 当前应用的 userId
 *
 *  @return
 */
- (void)pushBindWithUserId:(NSString *)userId completion:(void (^)(NSException *error))completion;

/**
 *  解除设备的deviceToken 与 当前应用的 userId的绑定关系，如在切换账号后，需重新绑定时调用
 *
 *  @param userId 当前应用的 userId
 *
 *  @return
 */
- (void)pushUnBindWithUserId:(NSString *)userId completion:(void (^)(NSException *error))completion;

/**
 * 打开推送消息的上报接口，用于统计推送消息的打开率
 * @param  userInfo 消息的 userInfo
 * @return
 */
- (void)pushOpenLogReport:(NSDictionary *)userInfo;

@end
