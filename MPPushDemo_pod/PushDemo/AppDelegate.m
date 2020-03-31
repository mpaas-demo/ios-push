

#import "AppDelegate.h"
#import <UserNotifications/UserNotifications.h>
#import <MPPushSDK/MPPushSDK.h>

@interface AppDelegate () <UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSDictionary *userInfo = [launchOptions objectForKey: UIApplicationLaunchOptionsRemoteNotificationKey];
    if ([[[UIDevice currentDevice] systemVersion] doubleValue] < 10.0) {
        // iOS 10 以下Push冷启动处理
        [self showAlert:userInfo];
    }
    
    if ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 10.0) {
        UNUserNotificationCenter* center = [UNUserNotificationCenter currentNotificationCenter];
        center.delegate = self;
    }
    return YES;
}


- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    // 绑定设备token
    [[PushService sharedService] setDeviceToken:deviceToken];
    // 绑定用户
    [[PushService sharedService] pushBindWithUserId:@"mpaas" completion:^(NSException *error) {
    }];
}


// 基于 iOS 7 及以上，iOS 10 以下的系统版本
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    [self showAlert:userInfo];
}


// 基于 iOS 10 及以上的系统版本
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler
{
    NSDictionary *userInfo = notification.request.content.userInfo;
    
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        //应用处于前台时的远程推送接受
        [self showAlert:userInfo];
    } else {
        //应用处于前台时的本地推送接受
        
    }
    completionHandler(UNNotificationPresentationOptionNone);
}

//// 基于 iOS 10 及以上的系统版本
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler
{
    NSDictionary *userInfo = response.notification.request.content.userInfo;
    
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        //应用处于后台或者活冷启动时远程推送接受
        [self showAlert:userInfo];
    } else {
        //应用处于前台时的本地推送接受
        
    }
    completionHandler();
    
}


- (void)showAlert:(NSDictionary *)userInfo
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"notification" message:[NSString stringWithFormat:@"%@", userInfo] delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
    [alertView show];
}

@end


