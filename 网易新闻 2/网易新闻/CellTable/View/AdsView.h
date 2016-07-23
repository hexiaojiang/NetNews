//
//  AdsView.h
//  网易新闻
//
//  Created by 刘世瑛 on 16/7/21.
//  Copyright © 2016年 TEXT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdsView : UITableViewHeaderFooterView<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic ,strong)NSArray *ads;
@end
