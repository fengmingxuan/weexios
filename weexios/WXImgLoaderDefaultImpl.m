//
//  WXImgLoaderDefaultImpl.m
//  weexios
//
//  Created by master on 17/3/24.
//  Copyright © 2017年 master. All rights reserved.
//

#import "WXImgLoaderDefaultImpl.h"
#import <WeexSDK/WeexSDK.h>
#import "SDWebImageManager.h"
@implementation WXImgLoaderDefaultImpl
#pragma mark -
#pragma mark WXImgLoaderProtocol
- (id<WXImageOperationProtocol>)downloadImageWithURL:(NSString *)url imageFrame:(CGRect)imageFrame userInfo:(NSDictionary *)userInfo completed:(void(^)(UIImage *image,  NSError *error, BOOL finished))completedBlock
{
    if ([url hasPrefix:@"//"]) {
        url = [@"http:" stringByAppendingString:url];
    }
    return (id<WXImageOperationProtocol>)[[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:url] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        if (completedBlock) {
            completedBlock(image, error, finished);
        }
    }];
}
@end
