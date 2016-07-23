//
//  AdsView.m
//  网易新闻
//
//  Created by 刘世瑛 on 16/7/21.
//  Copyright © 2016年 TEXT. All rights reserved.
//

#import "AdsView.h"
#import <Masonry.h>
#import "AdCell.h"
@implementation AdsView
{
    UICollectionView  * _adViews;
    UICollectionViewFlowLayout * _layout;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
        _adViews = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:_layout];
        [self.contentView addSubview:_adViews];
        
        _adViews.delegate = self;
        _adViews.dataSource = self;
        [_adViews mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.top.right.equalTo(self.contentView);
        }];
        [_adViews registerClass:[AdCell class] forCellWithReuseIdentifier:@"adCell"];
        _adViews.showsHorizontalScrollIndicator = NO;
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    _layout.itemSize = self.contentView.frame.size;
    _layout.minimumLineSpacing = 0;
    _layout.minimumInteritemSpacing = 0;
    _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _adViews.pagingEnabled = YES;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.x == 0) {
        [_adViews scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.ads.count inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    }else if(scrollView.contentOffset.x == _adViews.contentSize.width - [UIScreen mainScreen].bounds.size.width){
          [_adViews scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    }
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.ads.count + 2;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    AdCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"adCell" forIndexPath:indexPath];
    if (indexPath.item == 0) {
        cell.url = self.ads[self.ads.count - 1][@"imgsrc"];
        return cell;
    }
    if (indexPath.item == self.ads.count + 1) {
        cell.url = self.ads[0][@"imgsrc"];
        return cell;
    }
  
    cell.url = self.ads[indexPath.item - 1][@"imgsrc"];
  
    return cell;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
