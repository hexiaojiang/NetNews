//
//  CellModel.h
//  网易新闻
//
//  Created by 刘世瑛 on 16/7/21.
//  Copyright © 2016年 TEXT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellModel : NSObject
@property (nonatomic ,copy)NSString *title;
@property (nonatomic ,copy)NSString *subtitle;
@property (nonatomic ,copy)NSString *digest;
@property (nonatomic ,copy)NSString *ptime;//发布时间
@property (strong ,nonatomic)NSArray *imgextra;
@property (nonatomic ,copy)NSString *imgsrc;
@property (nonatomic ,copy)NSString *source;
@property (nonatomic ,strong)NSArray *ads;
@property (nonatomic ,copy)NSString *url;
@property (nonatomic ,assign)BOOL hasImg;
+ (NSArray *)translateArrIntoModelsWithArr:(NSArray *)arr;
@end
