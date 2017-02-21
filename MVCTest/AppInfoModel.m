//
//  AppInfoModel.m
//  MVCTest
//
//  Created by 李亚东 on 2017/2/20.
//  Copyright © 2017年 李亚东. All rights reserved.
//

#import "AppInfoModel.h"
@implementation AppInfoModel
- (instancetype)initWitDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.name = dict[@"name"];
        self.icon = dict[@"icon"];
    }
    return self;
}
+ (instancetype)appInfoWithDict:(NSDictionary *)dict {
    return [[self alloc] initWitDict:dict];
}

- (UIImage *)img {
    _img = [UIImage imageNamed:self.icon];
    return _img;
}

//把数据处理部分拿到模型中来处理
+(NSArray *)appinfoarray
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"appList.plist" ofType:nil];
    NSArray *arryM = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *appInfoArray = [NSMutableArray array];
    for (NSDictionary *dict in arryM) {
        [appInfoArray addObject:[AppInfoModel appInfoWithDict:dict]];
    }

    return appInfoArray;
}
@end
