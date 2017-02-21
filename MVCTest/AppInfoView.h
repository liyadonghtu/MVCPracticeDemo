//
//  AppInfoView.h
//  MVCTest
//
//  Created by 李亚东 on 2017/2/20.
//  Copyright © 2017年 李亚东. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppInfoModel.h"
@interface AppInfoView : UIView

@property (nonatomic, strong) UIButton *appInfoViewbtn;

//读取
//+(instancetype)appInfoView;
//只对外开放一个数据接口
+(instancetype)appInfoViewWithappInfo:(AppInfoModel *)appinfo;

@end
