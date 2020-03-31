

#import "DTFrameworkInterface+MPPushDemo_plugin.h"
#import <MPPushSDK/PushService.h>
#import <mPaas/MPaaSInterface.h>

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

@implementation DTFrameworkInterface (MPPushDemo_plugin)

- (BOOL)shouldLogReportActive
{
    return YES;
}

- (NSTimeInterval)logReportActiveMinInterval
{
    return 0;
}

- (BOOL)shouldLogStartupConsumption
{
    return YES;
}

- (BOOL)shouldAutoactivateBandageKit
{
    return YES;
}

- (BOOL)shouldAutoactivateShareKit
{
    return YES;
}

- (DTNavigationBarBackTextStyle)navigationBarBackTextStyle
{
    return DTNavigationBarBackTextStyleAlipay;
}


- (DTFrameworkCallbackResult)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    [[PushService sharedService] setDeviceToken:deviceToken];
    [[PushService sharedService] pushBindWithUserId:[[MPaaSInterface sharedInstance] userId] completion:^(NSException *error) {
    }];
 
    return DTFrameworkCallbackResultContinue;
}


- (DTFrameworkCallbackResult)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"notification" message:[NSString stringWithFormat:@"%@", userInfo] delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
    [alertView show];
    return DTFrameworkCallbackResultContinue;
}


@end

#pragma clang diagnostic pop
