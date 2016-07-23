//
//  ChannelModel.m
//  网易新闻
//
//  Created by 刘世瑛 on 16/7/19.
//  Copyright © 2016年 TEXT. All rights reserved.
//

#import "ChannelModel.h"
#import <YYModel.h>
@implementation ChannelModel


+ (NSArray *)GetChannels{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"topic_news.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSArray *arr = dict[@"tList"];
    NSMutableArray *mutableArr = [NSMutableArray arrayWithCapacity:arr.count];
    [arr enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [mutableArr addObject:[ChannelModel yy_modelWithDictionary:obj]];
    }];
    
    [mutableArr sortUsingComparator:^NSComparisonResult(ChannelModel * obj1, ChannelModel * obj2) {
       
        return [obj1.tid compare:obj2.tid];
    }];
    
    return mutableArr.copy;

    
    
}
@end
