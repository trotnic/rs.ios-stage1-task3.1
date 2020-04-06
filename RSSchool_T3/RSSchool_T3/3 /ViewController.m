#import "ViewController.h"
#import "ColorPickViewController.h"
#import "ResultViewController.h"

const int FIELD_HEIGHT = 40;
const int FIELD_WIDTH = 100;

@interface ViewController ()

@end

@implementation ViewController

#pragma mark Something great!

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ResultViewController *rvc = [ResultViewController new];
    [self addChildViewController:rvc];
    [self.view addSubview:rvc.view];
    [rvc.view setFrame:CGRectMake(20, self.view.bounds.size.height*0.15, self.view.bounds.size.width * 0.9, FIELD_HEIGHT)];
    [rvc didMoveToParentViewController:self];
    NSArray<NSString *> *fields = [[NSArray alloc] initWithObjects:@"RED", @"GREEN", @"BLUE", nil];
    NSArray<NSString *> *idTextFields = [[NSArray alloc] initWithObjects:@"textFieldRed", @"textFieldGreen", @"textFieldBlue", nil];
    NSArray<NSString *> *idColorLabels = [[NSArray alloc] initWithObjects:@"labelRed", @"labelGreen", @"labelBlue", nil];
    
    
    
    
    [fields enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        ColorPickViewController *vc = [[ColorPickViewController alloc] initCustomName:obj tfa:[idTextFields objectAtIndex:idx] cla:[idColorLabels objectAtIndex:idx]];
        [vc.view setTag:idx];
        [self addChildViewController:vc];
        [self.view addSubview:vc.view];
        [vc.view setFrame:CGRectMake(20, self.view.bounds.size.height*0.26 + FIELD_HEIGHT*2*idx, self.view.bounds.size.width * 0.9, FIELD_HEIGHT)];
        [vc didMoveToParentViewController:self];
        
    }];
    
    UIButton *performButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width*0.5 - 50, self.view.bounds.size.height*0.56, 100, 40)];
//    [performButton setBackgroundColor:UIColor.cyanColor];
    [performButton setTitleColor:UIColor.systemBlueColor forState:UIControlStateNormal];
    [performButton setTitleColor:UIColor.systemRedColor forState:UIControlStateHighlighted];
    
    [performButton setTitle:@"Process" forState:UIControlStateNormal];
    [performButton addTarget:self action:@selector(doThings) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:performButton];
        
    
    
    
    [performButton setAccessibilityIdentifier:@"buttonProcess"];
    [self.view setAccessibilityIdentifier:@"mainView"];
}

- (void)doThings {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"BeginCalcs" object:self];
    [self.view endEditing:true];
}

@end
