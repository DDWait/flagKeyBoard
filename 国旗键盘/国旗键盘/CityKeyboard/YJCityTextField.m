//
//  YJCityTextField.m
//  国旗键盘
//
//  Created by TOMY on 2019/6/11.
//  Copyright © 2019年 tone. All rights reserved.
//

#import "YJCityTextField.h"
#import "YJCityItm.h"

@interface YJCityTextField ()<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>

@property (nonatomic,strong) NSArray *cityArr;

@property (nonatomic,strong) UIPickerView *picker;

@property (nonatomic,assign) NSInteger index;
@end

@implementation YJCityTextField
-(NSArray *)cityArr
{
    if (_cityArr == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"provinces.plist" ofType:nil];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *temp = [NSMutableArray array];
        for (NSDictionary *dict in arr) {
            YJCityItm *item = [YJCityItm initwithDict:dict];
            [temp addObject:item];
        }
        _cityArr = temp;
    }
    return _cityArr;
}

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
    UIPickerView *picker = [[UIPickerView alloc] init];
    picker.delegate = self;
    picker.dataSource = self;
    self.inputView = picker;
    self.picker = picker;
    self.delegate = self;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return self.cityArr.count;
    }else{
        YJCityItm *item = self.cityArr[self.index];
        return item.cities.count;
    }
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        YJCityItm *item = self.cityArr[row];
        return item.name;
    }else{
        YJCityItm *item = self.cityArr[self.index];
        return item.cities[row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //记录第0列当前的行
    if (component == 0) {
        self.index = row;
        //刷新
        [pickerView reloadAllComponents];
        //让第1列的第0行成为选中状态(回到第一行)
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
    
    YJCityItm *item = self.cityArr[self.index];
    NSString *name = item.name;
    //获取第一列选中的行.
    NSInteger selectRow = [pickerView selectedRowInComponent:1];
    
    NSString *city = item.cities[selectRow];
    
    self.text = [NSString stringWithFormat:@"%@-%@",name,city];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return NO;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self pickerView:self.picker didSelectRow:0 inComponent:0];
}
@end
