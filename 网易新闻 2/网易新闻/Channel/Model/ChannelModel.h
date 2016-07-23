//
//  ChannelModel.h
//  网易新闻
//
//  Created by 刘世瑛 on 16/7/19.
//  Copyright © 2016年 TEXT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChannelModel : NSObject
@property (nonatomic ,copy)NSString *tname;
@property (nonatomic ,copy)NSString *tid;

+ (NSArray *)GetChannels;
@end
