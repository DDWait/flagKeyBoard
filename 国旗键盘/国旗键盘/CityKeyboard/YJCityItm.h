//
//  YJCityItm.h
//  国旗键盘
//
//  Created by TOMY on 2019/6/11.
//  Copyright © 2019年 tone. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YJCityItm : NSObject
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSArray *cities;
+(instancetype)initwithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
