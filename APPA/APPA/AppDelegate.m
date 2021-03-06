//
//  AppDelegate.m
//  APPA
//
//  Created by xiaobing on 15/10/28.
//  Copyright © 2015年 xiaobing. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self handlePushWithApplication:application options:launchOptions];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    NSLog(@"---->>>\n%s \n%@  ",__func__,url);
    return YES;
}
- (BOOL)application:(UIApplication *)application openURL:(nonnull NSURL *)url options:(nonnull NSDictionary<NSString *,id> *)options
{
    NSLog(@"---->>>\n%s \n%@  ",__func__,url);
    return YES;
}

- (void)handlePushWithApplication:(UIApplication *)application options:(NSDictionary *)launchOptions{
    // 新增通知注册
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0)
    {
        [application registerForRemoteNotifications];
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes: (UIUserNotificationTypeBadge | UIUserNotificationTypeAlert | UIUserNotificationTypeSound) categories:nil];
        [application registerUserNotificationSettings:settings];
    }
    else
    {
        /**
         *
         UIRemoteNotificationTypeBadge   = 1 << 0,
         UIRemoteNotificationTypeSound   = 1 << 1,
         UIRemoteNotificationTypeAlert   = 1 << 2,
         */
        [application registerForRemoteNotificationTypes:
         UIRemoteNotificationTypeBadge |
         UIRemoteNotificationTypeAlert |
         UIRemoteNotificationTypeSound];
    }
    
    /**
     *  处理程序呗杀死的情况下的推送
     */
    if (launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey])
    {
    }
    [application setApplicationIconBadgeNumber:0];
}

@end
