//
//  ViewController.m
//  APPA
//
//  Created by xiaobing on 15/10/28.
//  Copyright © 2015年 xiaobing. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()<UIAlertViewDelegate>

@end

@implementation ViewController

- (IBAction)button1Click:(id)sender {
    NSURL *url = [NSURL URLWithString:@"APPB://button1Click&src=hello"];
    [[UIApplication sharedApplication] openURL:url];
}

- (IBAction)button2Click:(id)sender {
    NSURL *url = [NSURL URLWithString:@"APPC://button2Click"];
    [[UIApplication sharedApplication] openURL:url];
}

- (IBAction)setWifi:(id)sender {
    NSString * UIApplicationOpenSettingsURLString = @"prefs:root=WIFI";
    NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    
    if([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
}

- (IBAction)judgeNotifaction:(id)sender {
    if([self isAllowedNotification]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Are You Allow Notifaction?" message:@"Yes You Have" delegate:self cancelButtonTitle:@"I Know" otherButtonTitles: nil];
        [alertView show];
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Are You Allow Notifaction?" message:@"NO You Have't" delegate:self cancelButtonTitle:@"I Know" otherButtonTitles:@"I want Open", nil];
        [alertView show];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
//    [[NSUserDefaults standardUserDefaults] setObject:url forKey:@"URL"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:url];
    url = nil;
    [array addObject:url];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex != 0) {
        NSString * UIApplicationOpenSettingsURLString = @"prefs:root=com.xiaoxiaobing.APPA";
        NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        
        if([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url];
        }
    }
}
-  (BOOL)isAllowedNotification {
    

    //iOS8 check if user allow notification
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {// system is iOS8
        UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
        if (UIUserNotificationTypeNone != setting.types) {
            return YES;
        }
    } else {//iOS7
        UIRemoteNotificationType type = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
        if(UIRemoteNotificationTypeNone != type)
            return YES;
    }
    return NO;
}


/**
 *
 About — prefs:root=General&path=About
 
 Accessibility — prefs:root=General&path=ACCESSIBILITY
 
 AirplaneModeOn— prefs:root=AIRPLANE_MODE
 
 Auto-Lock — prefs:root=General&path=AUTOLOCK
 
 Brightness — prefs:root=Brightness
 
 Bluetooth — prefs:root=General&path=Bluetooth
 
 Date& Time — prefs:root=General&path=DATE_AND_TIME
 
 FaceTime — prefs:root=FACETIME
 
 General— prefs:root=General
 
 Keyboard — prefs:root=General&path=Keyboard
 
 iCloud — prefs:root=CASTLE  iCloud
 
 Storage & Backup — prefs:root=CASTLE&path=STORAGE_AND_BACKUP
 
 International — prefs:root=General&path=INTERNATIONAL
 
 Location Services — prefs:root=LOCATION_SERVICES
 
 Music — prefs:root=MUSIC
 
 Music Equalizer — prefs:root=MUSIC&path=EQ
 
 Music VolumeLimit— prefs:root=MUSIC&path=VolumeLimit
 
 Network — prefs:root=General&path=Network
 
 Nike + iPod — prefs:root=NIKE_PLUS_IPOD
 
 Notes — prefs:root=NOTES
 
 Notification — prefs:root=NOTIFICATIONS_ID
 
 Phone — prefs:root=Phone
 
 Photos — prefs:root=Photos
 
 Profile — prefs:root=General&path=ManagedConfigurationList
 
 Reset — prefs:root=General&path=Reset
 
 Safari — prefs:root=Safari  Siri — prefs:root=General&path=Assistant
 
 Sounds — prefs:root=Sounds
 
 SoftwareUpdate— prefs:root=General&path=SOFTWARE_UPDATE_LINK
 
 Store — prefs:root=STORE
 
 Twitter — prefs:root=TWITTER
 
 Usage — prefs:root=General&path=USAGE
 
 VPN — prefs:root=General&path=Network/VPN
 
 Wallpaper — prefs:root=Wallpaper
 
 Wi-Fi — prefs:root=WIFI
 
 Setting—prefs:root=INTERNET_TETHERING
 */
@end
