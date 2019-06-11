//
//  YJDateTextField.m
//  国旗键盘
//
//  Created by TOMY on 2019/6/6.
//  Copyright © 2019年 tone. All rights reserved.
//

#import "YJDateTextField.h"


@interface YJDateTextField ()<UITextFieldDelegate>
@property (nonatomic,strong)UIDatePicker *datePicker;
@end

@implementation YJDateTextField
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setUp];
}
-(void)setUp
{
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    //设置地区
    datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    //时间格式
    datePicker.datePickerMode = UIDatePickerModeDate;
    //添加监听
    [datePicker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
    
    self.inputView = datePicker;
    self.delegate = self;
    self.datePicker = datePicker;
}

-(void)dateChange:(UIDatePicker *)datePicker
{
    //将日期转为字符串
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *dateString = [fmt stringFromDate:datePicker.date];
    self.text = dateString;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return NO;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self dateChange:self.datePicker];
}
@end
