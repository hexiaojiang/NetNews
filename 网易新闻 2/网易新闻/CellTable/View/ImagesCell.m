//
//  ImagesCell.m
//  网易新闻
//
//  Created by 刘世瑛 on 16/7/21.
//  Copyright © 2016年 TEXT. All rights reserved.
//

#import "ImagesCell.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
@implementation ImagesCell
{
    UIImageView   * _titleImg;
    UIImageView   * _subImg;
    UIImageView   * _lastImg;

    UILabel       * _topTitle;
    UILabel       * _detailTitle;
    UILabel       * _source;
    UILabel       * _time;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _topTitle = [[UILabel alloc] init];
        
        [self.contentView addSubview:_topTitle];
        
        [_topTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(8);
            make.top.equalTo(self.contentView).offset(8);
            make.right.equalTo(self.contentView).offset(-8);
             make.height.mas_equalTo(20);
        }];
        
        
        _titleImg = [[UIImageView alloc] init];
        [self.contentView addSubview:_titleImg];
        
        _subImg = [[UIImageView alloc] init];
        [self.contentView addSubview:_subImg];
        
        _lastImg = [[UIImageView alloc] init];
        [self.contentView addSubview:_lastImg];
        
        [_titleImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_topTitle.mas_bottom).offset(8);
            make.left.equalTo(self.contentView).offset(8);
            make.bottom.equalTo(self.contentView).offset(-20);
        }];
        [_subImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(_titleImg);
            make.size.equalTo(_titleImg);
            make.left.equalTo(_titleImg.mas_right).offset(8);
        }];
        [_lastImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(_titleImg);
            make.width.equalTo(_titleImg);

            make.left.equalTo(_subImg.mas_right).offset(8);
            make.right.equalTo(self.contentView).offset(-8);
        
        }];
        
        _source = [[UILabel alloc] init];
        [self.contentView addSubview:_source];
 
        [_source mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_topTitle);
            make.bottom.equalTo(self.contentView).offset(-8);
        }];
        _time = [[UILabel alloc] init];
        [self.contentView addSubview:_time];
        [_time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-8);
            make.bottom.equalTo(self.contentView).offset(-8);
        }];
        
        _topTitle.font = [UIFont systemFontOfSize:12];
        _topTitle.textColor = [UIColor blackColor];
        _source.font = [UIFont systemFontOfSize:10];
        _source.textColor = [UIColor grayColor];
        _time.font = [UIFont systemFontOfSize:10];
        _source.textColor = [UIColor grayColor];
         _topTitle.numberOfLines = 0;
    }
    return self;
}

-(void)setCellInfo:(CellModel *)cellInfo{
    cellInfo = cellInfo;
    _topTitle.text = cellInfo.title;
    _time.text = cellInfo.ptime;
    _source.text = cellInfo.source;
//    CGFloat realHeight = [_topTitle.text boundingRectWithSize:CGSizeMake(self.contentView.frame.size.width - 16, CGFLOAT_MAX) options:0 attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:12]} context:nil].size.width;
//    [_topTitle mas_updateConstraints:^(MASConstraintMaker *make) {
//        
//        make.height.mas_equalTo(realHeight);
//    }];
    
    [_titleImg sd_setImageWithURL:[NSURL URLWithString:cellInfo.imgsrc]];
//    __weak typeof(_titleImg) weakImg = _titleImg;
//    [_titleImg sd_setImageWithURL:[NSURL URLWithString:cellInfo.imgsrc] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        CGSize size = image.size;
//        [weakImg mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.height.equalTo(_titleImg.mas_width).multipliedBy(size.width / size.height);
//        }];
//        
//    }];

    [_subImg sd_setImageWithURL:[NSURL URLWithString:cellInfo.imgextra[0][@"imgsrc"]]];
    [_lastImg sd_setImageWithURL:[NSURL URLWithString:cellInfo.imgextra[1][@"imgsrc"]]];
   
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
