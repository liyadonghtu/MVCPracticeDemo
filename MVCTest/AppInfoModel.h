//
//  AppInfoModel.h
//  MVCTest
//
//  Created by 李亚东 on 2017/2/20.
//  Copyright © 2017年 李亚东. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AppInfoModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, strong) UIImage *img;

//工厂方法
- (instancetype)initWitDict:(NSDictionary *)dict;
+ (instancetype)appInfoWithDict:(NSDictionary *)dict;

+(NSArray *)appinfoarray;

@end
