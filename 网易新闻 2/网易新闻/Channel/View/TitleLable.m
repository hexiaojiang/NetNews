//
//  TitleLable.m
//  网易新闻
//
//  Created by 刘世瑛 on 16/7/19.
//  Copyright © 2016年 TEXT. All rights reserved.
//

#import "TitleLable.h"

@implementation TitleLable

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.textAlignment = NSTextAlignmentCenter;
        self.font = [UIFont systemFontOfSize:14];
    }
    return self;
}
- (void)setScale:(CGFloat)scale{
    _scale = scale;
    
    if (_scale) {
        [UIView animateWithDuration:1 animations:^{
            [self setTextColor:[UIColor redColor]];
            self.transform = CGAffineTransformMakeScale(1.2, 1.2);
        }];
    }else{
        [UIView animateWithDuration:1 animations:^{
            [self setTextColor:[UIColor blackColor]];
            self.transform = CGAffineTransformIdentity;
        }];
    }
   
    
    
}

@end
