//
//  YJFlagTextField.m
//  国旗键盘
//
//  Created by TOMY on 2019/6/6.
//  Copyright © 2019年 tone. All rights reserved.
//

#import "YJFlagTextField.h"
#import "YJFlagItem.h"
#import "YJFlagView.h"

@interface YJFlagTextField ()<UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>
@property (nonatomic,strong) NSArray *flagDate;
@property (nonatomic,strong) UIPickerView *pickerView;
@end

@implementation YJFlagTextField
//懒加载数据
-(NSArray *)flagDate
{
    if (!_flagDate) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"flags.plist" ofType:nil];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *temp = [NSMutableArray array];
        for (NSDictionary *dict in arr) {
            YJFlagItem *item = [YJFlagItem flagItemWithDict:dict];
            [temp addObject:item];
        }
        _flagDate = temp;
    }
    return _flagDate;
}
//代码创建
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}
//xib加载
- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setUp];
}

//初始化操作
-(void)setUp
{
    //创建UIPickerView对象
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    pickerView.dataSource = self;
    pickerView.delegate = self;
    self.inputView = pickerView;
    self.delegate = self;
    self.pickerView = pickerView;
}
//多少列
- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView
{
    return 1;
}
//每列多少行
- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.flagDate.count;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    YJFlagView *flagView = [YJFlagView flagView];
    flagView.item = self.flagDate[row];
    return flagView;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 100;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    YJFlagItem *item = self.flagDate[row];
    self.text = item.name;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return NO;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self pickerView:self.pickerView didSelectRow:0 inComponent:0];
}

@end
