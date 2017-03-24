//
//  WXEventModule.m
//  weexios
//
//  Created by master on 17/3/24.
//  Copyright © 2017年 master. All rights reserved.
//

#import "WXEventModule.h"
#import <WeexSDK/WeexSDK.h>
#import "ViewController.h"
@implementation WXEventModule

@synthesize weexInstance;

 
WX_EXPORT_METHOD(@selector(openUrl:callback:))

- (void)openUrl:(NSString *)url callback:(WXModuleCallback)callback
{
    NSString *newURL = url;
    if ([url hasPrefix:@"//"]) {
        newURL = [NSString stringWithFormat:@"http:%@", url];
    } else if (![url hasPrefix:@"http"]) {
        newURL = [NSURL URLWithString:url relativeToURL:weexInstance.scriptURL].absoluteString;
    }
    ViewController *controller = [[ViewController alloc] initWithJs:newURL];
//  ((WXDemoViewController *)controller).url = [NSURL URLWithString:newURL];
    [[weexInstance.viewController navigationController] pushViewController:controller animated:YES];
    
//    ViewController *vc=[[ViewController alloc]initWithJs:@"app.weex.js"];
//    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:vc];
//    self.window.rootViewController=nav;
//    
    callback(@{@"result":@"success"});
}
@end
