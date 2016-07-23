//
//  NewsCell.m
//  网易新闻
//
//  Created by 刘世瑛 on 16/7/19.
//  Copyright © 2016年 TEXT. All rights reserved.
//

#import "NewsCell.h"
#import "CellTableController.h"
#import <Masonry.h>
@implementation NewsCell
{
    CellTableController   * _cellController;
    
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _cellController = [[CellTableController alloc] init];
        [self.contentView addSubview:_cellController.tableView];
        
        [_cellController.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.equalTo(self.contentView);
        }];
        
        _cellController.tableView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/256.0 green:arc4random_uniform(256)/256.0 blue:arc4random_uniform(256)/256.0 alpha:1];
        

    }
    return self;
}
- (void)setUrlStr:(NSString *)urlStr{
    _urlStr = urlStr;
    _cellController.urlStr = urlStr;
}

@end
