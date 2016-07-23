//
//  AdCell.m
//  网易新闻
//
//  Created by 刘世瑛 on 16/7/21.
//  Copyright © 2016年 TEXT. All rights reserved.
//

#import "AdCell.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
@implementation AdCell
{
    UIImageView  * _showImg;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _showImg = [[UIImageView alloc] init];
        [self.contentView addSubview:_showImg];
        
        [_showImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.top.equalTo(self.contentView);
        }];
    }
    return self;
}
- (void)setUrl:(NSString *)url{
    _url = url;
    [_showImg sd_setImageWithURL:[NSURL URLWithString:url]];
}
@end
