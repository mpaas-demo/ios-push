
#import "MPaaSInterface+MPPushDemo_plugin.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

@implementation MPaaSInterface (MPPushDemo_plugin)

- (BOOL)enableSettingService
{
    return NO;
}

- (NSString *)userId
{
    return @"mpaas";
}

@end

#pragma clang diagnostic pop
