//
//  YJFlagItem.m
//  国旗键盘
//
//  Created by TOMY on 2019/6/6.
//  Copyright © 2019年 tone. All rights reserved.
//

#import "YJFlagItem.h"



@implementation YJFlagItem
+(instancetype)flagItemWithDict:(NSDictionary *) dict
{
    YJFlagItem * item = [[self alloc] init];
    [item setValuesForKeysWithDictionary:dict];
    return item;
}

- (void)setIcon:(UIImage *)icon
{
    NSString *img = (NSString *)icon;
    _icon = [UIImage imageNamed:img];
}
@end
