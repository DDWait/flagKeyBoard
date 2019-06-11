//
//  YJFlagItem.h
//  国旗键盘
//
//  Created by TOMY on 2019/6/6.
//  Copyright © 2019年 tone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YJFlagItem : NSObject
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) UIImage *icon;

+(instancetype)flagItemWithDict:(NSDictionary *) dict;
@end

NS_ASSUME_NONNULL_END
