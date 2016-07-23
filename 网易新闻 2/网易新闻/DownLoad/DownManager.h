//
//  DownManager.h
//  网易新闻
//
//  Created by 刘世瑛 on 16/7/19.
//  Copyright © 2016年 TEXT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import <UIImageView+WebCache.h>
@interface DownManager : AFHTTPSessionManager


+ (void)downLoadUrl:(NSString *)urlStr successed:(void(^)(NSArray *))successedBlock failed:(void(^)(NSError *))failtureBlock;

+ (void)downLoadImage:(NSString *)urlStr suceessed:(void(^)(UIImage *))successedBlock failed:(void(^)(NSError *))failtureBlock;
@end
