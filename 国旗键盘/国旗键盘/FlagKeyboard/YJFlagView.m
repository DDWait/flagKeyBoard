//
//  YJFlagView.m
//  国旗键盘
//
//  Created by TOMY on 2019/6/6.
//  Copyright © 2019年 tone. All rights reserved.
//

#import "YJFlagView.h"
#import "YJFlagItem.h"
@interface YJFlagView ()
@property (weak, nonatomic) IBOutlet UILabel *flagName;
@property (weak, nonatomic) IBOutlet UIImageView *flagIcon;
@end

@implementation YJFlagView

- (void)setItem:(YJFlagItem *)item
{
    _item = item;
    _flagName.text = item.name;
    _flagIcon.image = item.icon;
}

+(instancetype)flagView
{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([YJFlagView class]) owner:nil options:nil].lastObject;
}
@end
