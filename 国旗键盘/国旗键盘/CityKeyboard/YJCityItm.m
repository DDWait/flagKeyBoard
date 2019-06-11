//
//  YJCityItm.m
//  国旗键盘
//
//  Created by TOMY on 2019/6/11.
//  Copyright © 2019年 tone. All rights reserved.
//

#import "YJCityItm.h"

@implementation YJCityItm
+(instancetype)initwithDict:(NSDictionary *)dict
{
    YJCityItm *item = [[YJCityItm alloc] init];
    [item setValuesForKeysWithDictionary:dict];
    return item;
}
@end
