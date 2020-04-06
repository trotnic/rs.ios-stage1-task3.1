//
//  ResultViewController.m
//  RSSchool_T3
//
//  Created by Vladislav on 4/3/20.
//  Copyright © 2020 Alexander Shalamov. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()

@property(nonatomic, retain) NSString *colorResult;
@property(nonatomic, retain) NSMutableDictionary *colorRGB;
@property(nonatomic, retain) UIView *resultColor;
@property(nonatomic, retain) UILabel *colorLabel;
@end

@implementation ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupLabel];
    
    self.colorRGB = [[NSMutableDictionary alloc] initWithDictionary:@{
        @"RED" : @"",
        @"GREEN" : @"",
        @"BLUE" : @""
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doStuff:) name:@"calcs" object:nil];
    
    self.colorLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width*0.3, 40)];
    [self.colorLabel setText:@"Color"];
    self.resultColor = [[UIView alloc] initWithFrame:CGRectMake(self.colorLabel.frame.size.width, 0, self.view.bounds.size.width*0.9 - self.colorLabel.frame.size.width, 40)];
    [self.resultColor setBackgroundColor:UIColor.grayColor];
    [self.view addSubview:self.colorLabel];
    [self.view addSubview:self.resultColor];
    
    
    [self.colorLabel setAccessibilityIdentifier:@"labelResultColor"];
    [self.resultColor setAccessibilityIdentifier:@"viewResultColor"];
}

- (void)setupLabel {
    [self setColorResult:@"Color"];
}

- (void)doStuff:(NSNotification *)notification {
    
    NSDictionary *result = notification.userInfo;
//    CGFloat value = [result[@"result"] floatValue];
    [self.colorRGB setValue:result[@"result"] forKey:result[@"color"]];
    NSLog(@"%@", self.colorRGB);
    
    if(![self.colorRGB.allValues containsObject:@""]) {
        self.resultColor.backgroundColor = [[UIColor alloc] initWithRed:[self.colorRGB[@"RED"] floatValue]/255 green:[self.colorRGB[@"GREEN"] floatValue]/255 blue:[self.colorRGB[@"BLUE"] floatValue]/255 alpha:1];
        
        const CGFloat *components = CGColorGetComponents(self.resultColor.backgroundColor.CGColor);
              CGFloat r = components[0];
              CGFloat g = components[1];
              CGFloat b = components[2];
              NSString *hexString=[NSString stringWithFormat:@"0x%02X%02X%02X", (int)(r * 255), (int)(g * 255), (int)(b * 255)];
        self.colorLabel.text = hexString;
    } else {
        [self.colorLabel setText:@"Error"];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeToColor) name:@"beganPaint" object:nil];
    }
    
}

- (void)changeToColor {
    [self.colorLabel setText:@"Color"];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"beganPaint" object:self];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
