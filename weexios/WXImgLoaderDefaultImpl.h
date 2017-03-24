//
//  WXImgLoaderDefaultImpl.h
//  weexios
//
//  Created by master on 17/3/24.
//  Copyright © 2017年 master. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WeexSDK/WeexSDK.h>
@interface WXImgLoaderDefaultImpl : NSObject <WXImgLoaderProtocol>
-(id<WXImageOperationProtocol>)downloadImageWithURL:(NSString *)url imageFrame:(CGRect)imageFrame userInfo:(NSDictionary *)options completed:(void(^)(UIImage *image,  NSError *error, BOOL finished))completedBlock;
@end
