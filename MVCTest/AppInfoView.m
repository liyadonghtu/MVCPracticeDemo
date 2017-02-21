//
//  AppInfoView.m
//  MVCTest
//
//  Created by 李亚东 on 2017/2/20.
//  Copyright © 2017年 李亚东. All rights reserved.
//

#import "AppInfoView.h"

#import "AppInfoModel.h"
//私有扩展，把属性拿进来
@interface AppInfoView ()

@property (nonatomic, strong) UIImageView *appInfoViewimg;
@property (nonatomic, strong) UILabel *appInfoViewlab;
@property (strong,nonatomic) AppInfoModel *appinfo;

@end

@implementation AppInfoView

+(instancetype)appInfoView
{
    AppInfoView *appinfoview = [[AppInfoView alloc] initWithFrame:CGRectZero];
        return appinfoview;
}

+(instancetype)appInfoViewWithappInfo:(AppInfoModel *)appinfo {
    AppInfoView *appInfoView=[self appInfoView];
    
    [appInfoView.appInfoViewbtn addTarget:appInfoView action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];

    appInfoView.appinfo = appinfo;
    return appInfoView;
}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    
    return self;
}

-(void)setAppinfo:(AppInfoModel *)appinfoc
{
    //这里一定要记录变化
    _appinfo=appinfoc;
    self.appInfoViewimg.image=appinfoc.img;
    self.appInfoViewlab.text=appinfoc.name;
}

- (void)layoutSubviews {
    CGRect frame = self.frame;
    [self.appInfoViewimg setFrame:CGRectMake(0, 0, frame.size.width, frame.size.width)];
    [self addSubview:self.appInfoViewimg];
    
    [self.appInfoViewlab setFrame:CGRectMake(0, frame.size.width + 5, frame.size.width, 20)];
    [self addSubview:self.appInfoViewlab];
    
    
    [self.appInfoViewbtn setFrame:CGRectMake(0, frame.size.width + 30, frame.size.width, 30)];
    [self addSubview:self.appInfoViewbtn];
    [_appInfoViewbtn.layer setMasksToBounds:YES];
    [_appInfoViewbtn.layer setCornerRadius:self.appInfoViewbtn.frame.size.height / 6];

}


- (UIImageView *)appInfoViewimg {
    if (!_appInfoViewimg) {
        _appInfoViewimg = [[UIImageView alloc] initWithFrame:CGRectZero];
        _appInfoViewimg.image = [UIImage imageNamed:@"1"];
    }
    return _appInfoViewimg;
}

- (UILabel *)appInfoViewlab {
    if (!_appInfoViewlab) {
        _appInfoViewlab = [[UILabel alloc] initWithFrame:CGRectZero];
        _appInfoViewlab.text = @"大闹天空";
        _appInfoViewlab.textAlignment = NSTextAlignmentCenter;
        [_appInfoViewlab setFont:[UIFont systemFontOfSize:13]];
//        _appInfoViewlab.backgroundColor = [UIColor yellowColor];
    }
    return _appInfoViewlab;
}

- (UIButton *)appInfoViewbtn {
    if (!_appInfoViewbtn) {
        _appInfoViewbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_appInfoViewbtn setTitle:@"下载" forState:UIControlStateNormal];
        [_appInfoViewbtn setBackgroundColor:[UIColor redColor]];
    }
    return _appInfoViewbtn;
}

- (void)Click:(id)sender {
    
    self.appInfoViewbtn.enabled=NO;
    AppInfoModel *appinfo=self.appinfo;
    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(60, 450, 200, 20)];
    [lab setBackgroundColor:[UIColor lightGrayColor]];
    [lab setTextAlignment:NSTextAlignmentCenter];
    [lab setText:[NSString stringWithFormat:@"%@成功下载",appinfo.name]];
    //把lab添加到父视图（即view中）
    [self.superview addSubview:lab];
    
    lab.alpha=1.0;
    [UIView animateWithDuration:2.0 animations:^{
        lab.alpha=0;
    }completion:^(BOOL finished) {
        [lab removeFromSuperview];
    }];
}



@end
