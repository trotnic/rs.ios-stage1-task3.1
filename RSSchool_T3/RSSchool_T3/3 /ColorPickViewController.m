//
//  ColorPickViewController.m
//  RSSchool_T3
//
//  Created by Vladislav on 4/3/20.
//  Copyright © 2020 Alexander Shalamov. All rights reserved.
//

#import "ColorPickViewController.h"

@interface ColorPickViewController () <UITextFieldDelegate>

@property(nonatomic, retain) NSString *name;
@property(nonatomic, retain) NSString *placeholder;
@property(nonatomic, retain) UILabel *label;
@property(nonatomic, retain) UITextField *textField;
@property(nonatomic, retain) NSString *tfa;
@property(nonatomic, retain) NSString *cla;

@end

@implementation ColorPickViewController

- (instancetype)initCustomName:(NSString *)name tfa:(NSString *)tfa cla:(NSString *)cla
{
    self = [super init];
    if (self) {
        [self setName:name];
        [self setTfa:tfa];
        [self setCla:cla];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doSomeThing) name:@"beganCalcs" object:nil];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width*0.2, 40)];
    [self.label setText:self.name];
    [self.label setTextColor:[UIColor blackColor]];
    [self.label setBackgroundColor:[UIColor clearColor]];
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(self.label.frame.size.width, 0, self.view.bounds.size.width*0.9 - self.label.frame.size.width, 40)];
    [self.textField setPlaceholder:@"0..255"];
    [self.textField setBackgroundColor:[UIColor whiteColor]];
    [self.textField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.textField setDelegate:self];
    [self.view addSubview:self.textField];
    [self.view addSubview:self.label];
    
    
    [self.label setAccessibilityIdentifier:self.cla];
    [self.textField setAccessibilityIdentifier:self.tfa];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self setResult:textField.text];
}

//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    return [string intValue] ? true : false;
//    NSCharacterSet *allowed = [NSCharacterSet decimalDigitCharacterSet];
//    NSCharacterSet *current = [NSCharacterSet characterSetWithCharactersInString:string];
//    if([allowed isSupersetOfSet:current]) {
//        NSString *checkable = [textField.text stringByAppendingString:string];
//        if(!([checkable intValue] > 255) && [checkable length] < 4) {
//            return true;
//        }
//    }
//    return false;
//}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}

- (void)doSomeThing {
    NSString *result;
    
    NSCharacterSet *expected = [NSCharacterSet decimalDigitCharacterSet];
    
    if(![expected isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString:self.textField.text]] || self.textField.text.intValue > 255) {
        result = @"";
    } else {
        result = self.textField.text;
    }
    
    NSDictionary *data = @{@"result": result, @"color": self.name};
    NSNotification *sends = [[NSNotification alloc] initWithName:@"calcs" object:nil userInfo:data];
    [[NSNotificationCenter defaultCenter] postNotification:sends];
    [self.textField setText:@""];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"beganPaint" object:nil];
}

@end
