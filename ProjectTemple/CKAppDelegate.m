//
//  CKAppDelegate.m
//  ProjectTemple
//
//  Created by Mac on 14-5-16.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "CKAppDelegate.h"
#import "CKAPPDetailViewController.h"
#import "CKDetailViewModel.h"
#import "CKNotificationViewModel.h"
#import "CKNotificationViewController.h"

@implementation CKAppDelegate
@dynamic rootViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    CKNotificationViewModel * vm=[[CKNotificationViewModel alloc] init];
    self.rootViewController =[[CKNotificationViewController alloc] initWithViewModel:vm];
    
    
    //cofing log
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    

    [self.window makeKeyAndVisible];
    return YES;
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



#pragma mark -  daynamic property mothed
-(UIViewController*) rootViewController
{
    return _rootViewController;
}

-(void) setRootViewController:(UIViewController *)rootViewController
{
    _rootViewController=rootViewController;
    UIViewController * finalRootController=rootViewController;
    if(![rootViewController isKindOfClass:[UITabBarController class]] && ![rootViewController isKindOfClass:[UINavigationController class]])
    {
        finalRootController=[[UINavigationController alloc] initWithRootViewController:_rootViewController];
    }
    
    self.window.rootViewController=finalRootController;
}


@end
