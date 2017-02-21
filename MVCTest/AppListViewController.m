//
//  AppListViewController.m
//  MVCTest
//
//  Created by 李亚东 on 2017/2/20.
//  Copyright © 2017年 李亚东. All rights reserved.
//

#import "AppListViewController.h"
#import "AppInfoView.h"
#import "AppInfoModel.h"


@interface AppListViewController ()

@property (nonatomic, strong) NSArray *apps;

@end

@implementation AppListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    int totalloc = 3;
    CGFloat appviewW = 80;
    CGFloat appviewH = appviewW / 5 * 8;
    CGFloat margin = (self.view.frame.size.width-totalloc*appviewW)/(totalloc+1);
    
    NSInteger count = self.apps.count;
    for (int i = 0; i < count; i++) {
        int row = i/totalloc;
        int loc = i%totalloc;
        
        CGFloat appviewX = margin + (margin + appviewW) * loc;
        CGFloat appviewY =  margin + (margin + appviewH) * row;
        
        AppInfoModel *appinfo = self.apps[i];
        
        AppInfoView *appinfoview=[AppInfoView appInfoViewWithappInfo:appinfo];
       
        [appinfoview setFrame:CGRectMake(appviewX, appviewY, appviewW, appviewH)];
        
        [self.view addSubview:appinfoview];
    }
}
#pragma mark -- lazyLoad
- (NSArray *)apps {
    if (!_apps) {
        _apps = [AppInfoModel appinfoarray];
    }
    return _apps;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
