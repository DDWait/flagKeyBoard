//
//  YJFlagView.h
//  国旗键盘
//
//  Created by TOMY on 2019/6/6.
//  Copyright © 2019年 tone. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YJFlagItem;
NS_ASSUME_NONNULL_BEGIN

@interface YJFlagView : UIView
@property (nonatomic,strong) YJFlagItem *item;
+(instancetype)flagView;
@end

NS_ASSUME_NONNULL_END
