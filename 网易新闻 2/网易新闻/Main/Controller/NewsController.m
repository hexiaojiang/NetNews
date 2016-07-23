//
//  NewsController.m
//  网易新闻
//
//  Created by 刘世瑛 on 16/7/19.
//  Copyright © 2016年 TEXT. All rights reserved.
//

#import "NewsController.h"
#import "ChannelView.h"
#import "ChannelModel.h"
#import <Masonry.h>
#import "NewsCell.h"
@interface NewsController ()<UICollectionViewDelegate,UICollectionViewDataSource,ChannelViewDelegate>
@property (strong ,nonatomic)NSArray *cellInfo;

@end

@implementation NewsController
{
    ChannelView   * _topView;
    UICollectionView * _collectinView;
    UICollectionViewFlowLayout *_flowLayout;
    
}

static NSString * const reuseIdentifier = @"News";
- (instancetype)init{
   
    self = [super init];
    if (self) {
        self.title = @"网易新闻";
        self.view.backgroundColor = [UIColor whiteColor];
        _topView = [[ChannelView alloc] init];
        [self.view addSubview:_topView];
        [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
            make.height.equalTo(@44);
            make.top.equalTo(self.mas_topLayoutGuideBottom);
        }];
        _topView.channelArr = self.cellInfo;
        _topView.delegate = self;
        self.automaticallyAdjustsScrollViewInsets = NO;
        
          UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout = layout;
          _collectinView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [self.view addSubview:_collectinView];
        [_collectinView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
            make.top.equalTo(_topView.mas_bottom);
            make.bottom.equalTo(self.view);
        }];
       
        [_collectinView registerClass:[NewsCell class] forCellWithReuseIdentifier:reuseIdentifier];
        _collectinView.backgroundColor = [UIColor redColor];
        _collectinView.delegate = self;
        _collectinView.dataSource = self;
    }
    return self;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView == _collectinView) {
        
        NSInteger idx = [_collectinView indexPathForCell:[_collectinView visibleCells][0]].item;
        _topView.selectedIdx = idx;
    }
    
}

- (void)didClickChannel:(ChannelView *)channel sendUrl:(NSInteger)indx{
    [_collectinView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:indx inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}
- (NSArray *)cellInfo{
    if (_cellInfo == nil) {
        _cellInfo = [ChannelModel GetChannels];
    }
    return _cellInfo;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes

    
    // Do any additional setup after loading the view.
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    _flowLayout.itemSize = CGSizeMake(_collectinView.frame.size.width, _collectinView.frame.size.height);
    _flowLayout.minimumLineSpacing = 0;
    _flowLayout.minimumInteritemSpacing = 0;
    _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _collectinView.pagingEnabled = YES;
    _collectinView.bounces = NO;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return self.cellInfo.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NewsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSArray *subviews = [[NSArray alloc] initWithArray:cell.contentView.subviews];
    UITableView *tab = subviews.firstObject;
    for (UIView *subview in tab.subviews) {
        for (UIView *sb in subview.subviews) {
            [sb removeFromSuperview];
        }
    }
    ChannelModel *model = self.cellInfo[indexPath.item];
    cell.urlStr = model.tid;
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
