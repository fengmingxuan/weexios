//
//  AppDelegate.m
//  weexios
//
//  Created by master on 17/3/24.
//  Copyright © 2017年 master. All rights reserved.
//

#import "AppDelegate.h"
#import <WeexSDK/WeexSDK.h>
#import "ViewController.h"
#import "WXImgLoaderDefaultImpl.h"
#import "WXEventModule.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //http://192.168.1.15:8080/dist/app.weex.js
    [self initWeex];
    ViewController *vc=[[ViewController alloc]initWithJs:@"app.weex.js"];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:vc];
    self.window.rootViewController=nav;
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

-(void)initWeex{
    //business configuration
    [WXAppConfiguration setAppGroup:@"TaogubaApp"];
    [WXAppConfiguration setAppName:@"weexDemo"];
    [WXAppConfiguration setAppVersion:@"1.0.0"];
    //init sdk enviroment
    [WXSDKEngine initSDKEnvironment];
    
    //WXSDKEngine.h
    /**
     * @abstract Registers a handler for a given handler instance and specific protocol
     * @param handler The handler instance to register
     * @param protocol The protocol to confirm
     */
    //+ (void)registerHandler:(id)handler withProtocol:(Protocol *)protocol;
    [WXSDKEngine registerHandler:[WXImgLoaderDefaultImpl new] withProtocol:@protocol(WXImgLoaderProtocol)];
    
    /**
     *  @abstract Registers a module for a given name
     *  @param name The module name to register
     *  @param clazz  The module class to register
     **/
    //+ (void)registerModule:(NSString *)name withClass:(Class)clazz;
    [WXSDKEngine registerModule:@"weexModule" withClass:[WXEventModule class]];
}

@end
