//
//  NewsShowController.m
//  网易新闻
//
//  Created by 刘世瑛 on 16/7/21.
//  Copyright © 2016年 TEXT. All rights reserved.
//

#import "NewsShowController.h"
#import <Masonry.h>
@interface NewsShowController ()

@end

@implementation NewsShowController
{
    UIWebView   * _webView;
    UIButton    * _backButton;
}
- (instancetype)init{
    self = [super init];
    if (self) {
        
        _webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [self.view addSubview:_webView];
        
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_webView addSubview:_backButton];
        
        [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(_webView).offset(8);
            make.width.mas_equalTo(20);
            make.height.mas_equalTo(20);
        }];
        [_backButton setBackgroundColor:[UIColor blackColor]];
        [_backButton addTarget:self action:@selector(didback) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    return self;
}
- (void)setUrl:(NSString *)url{
    _url = url;
    NSURL *load =  [NSURL URLWithString:url];
    if (load) {
        [_webView loadRequest:[NSURLRequest requestWithURL:load]];
    }
}
//- (void)didback{
////    [self dismissModalViewControllerAnimated:YES];
//    [self dismissViewControllerAnimated:YES completion:^{
//        _BackBlock();
//    }];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
