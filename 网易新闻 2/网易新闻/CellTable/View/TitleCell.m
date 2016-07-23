//
//  TitleCell.m
//  网易新闻
//
//  Created by 刘世瑛 on 16/7/21.
//  Copyright © 2016年 TEXT. All rights reserved.
//

#import "TitleCell.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
@implementation TitleCell
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

        _detailTitle = [[UILabel alloc] init];
        [self.contentView addSubview:_detailTitle];

        _source = [[UILabel alloc] init];
        [self.contentView addSubview:_source];

        _time = [[UILabel alloc] init];
        [self.contentView addSubview:_time];

        
        [_titleImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self.contentView).offset(8);
            make.bottom.equalTo(self.contentView).offset(-8);
            make.height.equalTo(_titleImg.mas_width);
            
            
        }];
        [_topTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_titleImg);
            make.left.equalTo(_titleImg.mas_right).offset(8);
            make.right.equalTo(self.contentView).offset(-8);
        }];
        [_detailTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_topTitle.mas_bottom);
            make.left.equalTo(_topTitle);
            make.right.equalTo(self.contentView).offset(-8);
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
        _topTitle.numberOfLines = 0;
        _topTitle.textColor = [UIColor blackColor];
        _detailTitle.font = [UIFont systemFontOfSize:12];
        _detailTitle.textColor = [UIColor grayColor];
        _source.font = [UIFont systemFontOfSize:10];
        _source.textColor = [UIColor grayColor];
        _time.font = [UIFont systemFontOfSize:10];
        _source.textColor = [UIColor grayColor];
        
        [self layoutIfNeeded];

    }
    return self;
}


- (void)setCellInfo:(CellModel *)cellInfo{
    cellInfo = cellInfo;
    
    __weak typeof (self) weakSelf = self;
    __weak typeof (_titleImg) weakImg = _titleImg;
//    [_titleImg sd_setImageWithURL:[NSURL URLWithString:cellInfo.imgsrc] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        if (error == nil) {
//            _titleImg.image = image;
//            CGSize size = image.size;
//           
//            [weakImg mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.width.equalTo(weakImg.mas_height).multipliedBy(size.width / size.height);
//            }];
//            [weakSelf layoutIfNeeded];
//        }
//    }];
    [_titleImg sd_setImageWithURL:[NSURL URLWithString:cellInfo.imgsrc]];
    _topTitle.text = cellInfo.title;
    if (cellInfo.digest.length) {
        _detailTitle.text = cellInfo.digest;
    }
    
    _time.text =cellInfo.ptime;
    _source.text = cellInfo.source;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
