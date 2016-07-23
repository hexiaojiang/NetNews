//
//  DownManager.m
//  网易新闻
//
//  Created by 刘世瑛 on 16/7/19.
//  Copyright © 2016年 TEXT. All rights reserved.
//

#import "DownManager.h"
static DownManager *manger;
@interface DownManager()
@property (strong ,nonatomic)NSMutableDictionary *OperationCache;
@property (copy ,nonatomic)NSString *urlFormat;
@end
@implementation DownManager

//+(instancetype)defaultMangager{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        manger = [DownManager manager];
//    });
//    return manger;
//}
+ (instancetype)manager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manger = [[super alloc] initWithBaseURL:[NSURL URLWithString:@"http://c.m.163.com/nc/article/list/"]];
//        [manger setValue: [NSURL URLWithString:@"http://c.m.163.com/nc/"]forKey:@"baseURL"] ;
        manger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    });
    
    return manger;
    
}
+ (void)downLoadUrl:(NSString *)urlStr successed:(void (^)(NSArray *))successedBlock failed:(void (^)(NSError *))failtureBlock{
    manger = [DownManager manager];
    
    if ([manger.OperationCache objectForKey:urlStr]) {
        return;
    }else{
        NSOperation *lastOp = [manger.OperationCache objectForKey:manger.urlFormat];
        [lastOp cancel];
    }
    
    NSLog(@"%@",[NSString stringWithFormat:@"%@/0-20.html",urlStr]);
 NSOperation *op =  [NSBlockOperation blockOperationWithBlock:^{
       
   [manger GET:[NSString stringWithFormat:@"%@/0-20.html",urlStr] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        NSDictionary *dict = responseObject;
        NSString *rootNood = dict.keyEnumerator.allObjects.firstObject;
        successedBlock(dict[rootNood]);
       
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failtureBlock(error);
    }];
   }];
    
    [manger.OperationCache setObject:op forKey:urlStr];
    manger.urlFormat = urlStr;
    [[NSOperationQueue mainQueue] addOperation:op];
    
    
    
}
+ (void)downLoadImage:(NSString *)urlStr suceessed:(void (^)(UIImage *img))successedBlock failed:(void (^)(NSError *))failtureBlock{
    
}
@end
