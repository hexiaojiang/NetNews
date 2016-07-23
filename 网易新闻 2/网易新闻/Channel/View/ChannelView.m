//
//  ChannelView.m
//  网易新闻
//
//  Created by 刘世瑛 on 16/7/19.
//  Copyright © 2016年 TEXT. All rights reserved.
//
#import <objc/runtime.h>
#import "ChannelView.h"
#import "ChannelModel.h"
#import "TitleLable.h"
@implementation ChannelView
- (instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}
- (void)setChannelArr:(NSArray *)channelArr{
    _channelArr = channelArr;
    CGFloat width = 60;
  __block  CGRect rect ;
    [channelArr enumerateObjectsUsingBlock:^(ChannelModel * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        TitleLable *lb = [[TitleLable alloc] init];
        [self addSubview:lb];
        lb.frame = CGRectMake(idx * width, 0, width, 44);
        lb.text = obj.tname;
        lb.url = obj.tid;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTouchLb:)];
        [lb addGestureRecognizer:tap];
        lb.scale = 0;
        if (!idx) {
            lb.scale = 1;
        }
        
        if (idx == channelArr.count - 1) {
            rect = lb.frame;
            
        }
    }];
    self.userInteractionEnabled = YES;
    self.contentSize = CGSizeMake(CGRectGetMaxX(rect) , 0);
    self.showsHorizontalScrollIndicator = NO;
    self.bounces = NO;
    
}

- (void)didTouchLb:(UITapGestureRecognizer *)tap{
    
    [self setSelectedIdx:[self.subviews indexOfObject:((TitleLable *)tap.view)]];
}
//- (void)didTouch:(NSInteger)tapView{
//    CGFloat CenterX = self.subviews[tapView].center.x;
//    if (CenterX > [UIScreen mainScreen].bounds.size.width / 2 && CenterX < self.contentSize.width - [UIScreen mainScreen].bounds.size.width /2) {
//        [self setContentOffset:CGPointMake(CenterX - [UIScreen mainScreen].bounds.size.width /2, 0) animated:YES];
//    }else if(CenterX >= self.contentSize.width - [UIScreen mainScreen].bounds.size.width /2){
//        [self setContentOffset:CGPointMake(self.contentSize.width - [UIScreen mainScreen].bounds.size.width, 0) animated:YES];
//    }else if(CenterX <= [UIScreen mainScreen].bounds.size.width /2){
//        [self setContentOffset:CGPointZero animated:YES];
//    }
//    if ([self.delegate respondsToSelector:@selector(didClickChannel:sendUrl:)]) {
//        [self.delegate didClickChannel:self sendUrl:tapView];
//    }
//    
//    [self setSelectedIdx:tapView];
//}
- (void)setSelectedIdx:(NSInteger)selectedIdx{
  
    TitleLable * lb = self.subviews[self.selectedIdx];
    lb.scale = 0;
    _selectedIdx = selectedIdx;
    
     lb = self.subviews[self.selectedIdx];
    lb.scale = 1;
    CGFloat CenterX = self.subviews[selectedIdx].center.x;
    if (CenterX > [UIScreen mainScreen].bounds.size.width / 2 && CenterX < self.contentSize.width - [UIScreen mainScreen].bounds.size.width /2) {
        [self setContentOffset:CGPointMake(CenterX - [UIScreen mainScreen].bounds.size.width /2, 0) animated:YES];
    }else if(CenterX >= self.contentSize.width - [UIScreen mainScreen].bounds.size.width /2){
        [self setContentOffset:CGPointMake(self.contentSize.width - [UIScreen mainScreen].bounds.size.width, 0) animated:YES];
    }else if(CenterX <= [UIScreen mainScreen].bounds.size.width /2){
        [self setContentOffset:CGPointZero animated:YES];
    }
    if ([self.delegate respondsToSelector:@selector(didClickChannel:sendUrl:)]) {
        [self.delegate didClickChannel:self sendUrl:selectedIdx];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
