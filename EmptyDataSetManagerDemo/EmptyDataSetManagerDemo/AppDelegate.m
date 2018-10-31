//
//  AppDelegate.m
//  EmptyDataSetManagerDemo
//
//  Created by 仁和Mac on 2018/10/31.
//  Copyright © 2018年 AbelZ. All rights reserved.
//

#import "AppDelegate.h"
#import "EmptyDataSetManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [EmptyDataSetManager appearance].image = [UIImage imageNamed:@"no_resource"];
    [EmptyDataSetManager appearance].title = @"CocoaChina_让移动开发更简单!!";
    [EmptyDataSetManager appearance].titleAttibutes = @{NSForegroundColorAttributeName:[UIColor purpleColor],NSFontAttributeName:[UIFont systemFontOfSize:14]};
    [EmptyDataSetManager appearance].message = @"CocoaChina_让移动开发更简单!!CocoaChina_让移动开发更简单!!";
    [EmptyDataSetManager appearance].messageAttributes = @{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont systemFontOfSize:14]};
    [EmptyDataSetManager appearance].buttonTitle = @"重新加载";
    [EmptyDataSetManager appearance].buttonTitleAttributes = @{NSForegroundColorAttributeName:[UIColor blueColor],NSFontAttributeName:[UIFont systemFontOfSize:16]};
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [indicator startAnimating];
    [EmptyDataSetManager appearance].customView = indicator;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.repeatCount = HUGE;
    animation.duration = 2.f;
    animation.toValue = @(M_PI);
    [EmptyDataSetManager appearance].imageAnimation = animation;
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
