//
//  PictureCell.m
//  网易新闻
//
//  Created by 刘世瑛 on 16/7/21.
//  Copyright © 2016年 TEXT. All rights reserved.
//

#import "PictureCell.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
@implementation PictureCell
{
    UIImageView   * _titleImg;
    UILabel       * _topTitle;
    UILabel       * _detailTitle;
    UILabel       * _source;
    UILabel       * _time;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _titleImg = [[UIImageView alloc] init];
        [self.contentView addSubview:_titleImg];
        _topTitle = [[UILabel alloc] init];
        [self.contentView addSubview:_topTitle];
        

        _source = [[UILabel alloc] init];
        [self.contentView addSubview:_source];

        _time = [[UILabel alloc] init];
        [self.contentView addSubview:_time];

        [_topTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(8);
            make.top.equalTo(self.contentView).offset(8);
            make.right.equalTo(self.contentView).offset(-8);
        }];
        
        [_titleImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(16);
            make.right.equalTo(self.contentView).offset(-16);
            make.top.equalTo(_topTitle.mas_bottom).offset(8);
            make.bottom.equalTo(self.contentView).offset(-20);
        }];
        
        [_source mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_topTitle);
            make.bottom.equalTo(self.contentView).offset(-8);
        }];
        
        [_time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-8);
            make.bottom.equalTo(self.contentView).offset(-8);
        }];
        
        _topTitle.font = [UIFont systemFontOfSize:14];
        _topTitle.textColor = [UIColor blackColor];
        _source.font = [UIFont systemFontOfSize:10];
        _source.textColor = [UIColor grayColor];
        _time.font = [UIFont systemFontOfSize:10];
        _source.textColor = [UIColor grayColor];
         _topTitle.numberOfLines = 0;
    }
    return self;
}
- (void)setCellInfo:(CellModel *)cellInfo{
    cellInfo = cellInfo;
    
    [_titleImg sd_setImageWithURL:[NSURL URLWithString:cellInfo.imgsrc]];
    _time.text = cellInfo.ptime;
    _source.text = cellInfo.source;
    _topTitle.text = cellInfo.title;
    [self layoutIfNeeded];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
