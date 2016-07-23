//
//  ChannelView.h
//  网易新闻
//
//  Created by 刘世瑛 on 16/7/19.
//  Copyright © 2016年 TEXT. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ChannelView;
@protocol ChannelViewDelegate <NSObject>

- (void)didClickChannel:(ChannelView *)channel sendUrl:(NSInteger)indx;

@end
@interface ChannelView : UIScrollView
@property (strong ,nonatomic)NSArray *channelArr;
@property (assign ,nonatomic)NSInteger selectedIdx;
@property (weak ,nonatomic)id<ChannelViewDelegate>delegate;
@end
