//
//  NewsShowController.h
//  网易新闻
//
//  Created by 刘世瑛 on 16/7/21.
//  Copyright © 2016年 TEXT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsShowController : UIViewController
@property (nonatomic ,copy)NSString *url;
@property (nonatomic ,copy)void (^BackBlock)();
@end
