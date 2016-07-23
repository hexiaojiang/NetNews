//
//  CellModel.m
//  网易新闻
//
//  Created by 刘世瑛 on 16/7/21.
//  Copyright © 2016年 TEXT. All rights reserved.
//

#import "CellModel.h"
#import <YYModel.h>
@implementation CellModel
+ (NSArray *)translateArrIntoModelsWithArr:(NSArray *)arr{
    NSMutableArray *mArr = [NSMutableArray array];
    [arr enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [mArr addObject:[CellModel yy_modelWithDictionary:obj]];
    }];
    return mArr.copy;
}
@end
