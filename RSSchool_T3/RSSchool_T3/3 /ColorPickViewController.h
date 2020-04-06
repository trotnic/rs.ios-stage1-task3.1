//
//  ColorPickViewController.h
//  RSSchool_T3
//
//  Created by Vladislav on 4/3/20.
//  Copyright © 2020 Alexander Shalamov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ColorPickViewController : UIViewController
@property(nonatomic, weak) NSString *result;
- (instancetype)initCustomName:(NSString *)name tfa:(NSString *)tfa cla:(NSString *)cla;
@end

NS_ASSUME_NONNULL_END
