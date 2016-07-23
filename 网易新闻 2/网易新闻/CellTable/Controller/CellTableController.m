//
//  CellTableController.m
//  网易新闻
//
//  Created by 刘世瑛 on 16/7/19.
//  Copyright © 2016年 TEXT. All rights reserved.
//

#import "CellTableController.h"
#import "DownManager.h"
#import "CellModel.h"
#import "TitleCell.h"
#import "PictureCell.h"
#import "ImagesCell.h"
#import "NewsShowController.h"
#import "AdsView.h"
#define TitleCellIdentifier @"TitleCell"
#define PictureCellIdentifier @"PictureCell"
#define ImagesCellIdentifier @"ImagesCell"

@interface CellTableController ()
@property (strong ,nonatomic)NSArray *newsArr;
@property (strong ,nonatomic)NewsShowController *newsView;

@end
//static NSString *const identifier = @"tableCell1";
//static NSString *const identifier1 = @"tableCell2";
//static NSString *const identifier2 = @"tableCell3";


@implementation CellTableController
- (NewsShowController *)newsView{
    if (_newsView == nil) {
        _newsView = [[NewsShowController alloc] init];
    }
    return _newsView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[TitleCell class] forCellReuseIdentifier:TitleCellIdentifier];
    [self.tableView registerClass:[PictureCell class] forCellReuseIdentifier:PictureCellIdentifier];
    [self.tableView registerClass:[ImagesCell class] forCellReuseIdentifier:ImagesCellIdentifier];
//    [self.tableView registerClass:[AdsView class] forHeaderFooterViewReuseIdentifier:@"AdHead"];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.bounces = NO;
    
    
    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
   
    
    
    
   

}

- (void)setUrlStr:(NSString *)urlStr{
    _urlStr = urlStr;
    [DownManager downLoadUrl:urlStr successed:^(NSArray *news) {
        self.newsArr = [CellModel translateArrIntoModelsWithArr:news];
        if (self.newsArr.count > 0) {
            
        if (((CellModel *)self.newsArr[0]).ads.count > 0) {
            AdsView *headV = [[AdsView alloc] initWithFrame:CGRectMake(0, 0, 0, 150)];
            headV.ads = ((CellModel *)self.newsArr[0]).ads;
            self.tableView.tableHeaderView = headV;
        }else{
            self.tableView.tableHeaderView = nil;
        }
        }
        [self.tableView reloadData];
    } failed:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.newsArr.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    CellModel *model = self.newsArr[indexPath.row];
    NSString *identifier;
    identifier = model.imgextra == nil ? TitleCellIdentifier : ImagesCellIdentifier;
    if (model.hasImg) identifier = PictureCellIdentifier;
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    cell.cellInfo = model;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CellModel *model = self.newsArr[indexPath.row];
    if (model.imgextra == nil) {
        
        if (model.hasImg) {
            return 150;
        }
        return 80;
        
    }
    return 120;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    CellModel *model = self.newsArr[indexPath.row];
//    self.newsView.url = model.url;
//     __weak typeof (self) weakSelf = self;
//    void (^backBlock)() = ^{
//        [weakSelf.tableView reloadData];
//    };
//    self.newsView.BackBlock = backBlock;
//    [self presentViewController:self.newsView animated:YES completion:^{
//       
//    }];
//}
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    AdsView *headV = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"AdHead" ];
//    
//    if (!headV) {
//        headV = [[AdsView alloc] initWithFrame:CGRectMake(0, 0, 0, 150)];
//    }
//    
//    if (((CellModel *)self.newsArr[0]).ads.count > 0) {
//         headV.ads = ((CellModel *)self.newsArr[0]).ads;
//    }else{
//        headV = nil;
//    }
//    
//    return headV;
//}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
