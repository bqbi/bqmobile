//
//  BQAppDelegate.m
//  BQMobile
//
//  Created by 潘 巍 on 14-2-18.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQAppDelegate.h"
#import "BQCore.h"

#import "BQIpadLoginController.h"
#import "BQNavigationController.h"
#import "BQSplashWindowController.h"
#import "BQIphoneLoginController.h"
#import "BQIphoneLoadingController.h"

@implementation BQAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];

    if(isPad)
    {
        self.loginController = [[BQIpadLoginController alloc] initWithNibName:nil bundle:nil];
        self.navigationController = [[BQNavigationController alloc] initWithRootViewController:self.loginController];
        NSLog(@" is pad %@", @"YES");
    }
    else
    {
        self.loginController = [[BQIphoneLoginController alloc] initWithNibName:nil bundle:nil];
        self.navigationController = [[BQNavigationController alloc] initWithRootViewController:self.loginController];

        NSLog(@" is pad %@", @"NO");
    }
    
    self.window.rootViewController = [[BQSplashWindowController alloc] init];// self.navigationController;
    
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(switchToLoadingController:) userInfo:self.navigationController repeats:NO];
    
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void) switchToLoadingController:(NSTimer*)timer
{
    // 加载loading
    self.window.rootViewController = [[BQIphoneLoadingController alloc] init];
    // 加载loading
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(switchToRootController:) userInfo:self.navigationController repeats:NO];
    
}

- (void) switchToRootController:(NSTimer*) timer
{
    // 加载闪屏
    self.window.rootViewController = self.navigationController;
    // 加载root
    [self.window addSubview:self.navigationController.view];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
