#import "PolynomialConverter.h"
        
@implementation PolynomialConverter
- (NSString*)convertToStringFrom:(NSArray <NSNumber*>*)numbers {
    if([numbers isEqual:@[]]) return nil;
    NSUInteger polyDegree = [numbers count] - 1;
    __block NSMutableString *result = [NSMutableString new];
        
    [numbers enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if(obj.intValue == 0) {
            return;
        }
        
        NSString *degree = idx == polyDegree || polyDegree - idx == 1 ?
        @"" : [NSString stringWithFormat:@"%lu", (unsigned long)(polyDegree - idx)];
        NSString *degSign = ![degree  isEqual: @""] ? @"^" : @"";
        NSString *x = idx == polyDegree ? @"" : @"x";
        NSString *sign = idx == 0 ? @"" : obj.intValue > 0 ? @" + " : @" - ";
        NSString *value = abs(obj.intValue) == 1 ? @"" : [NSString stringWithFormat:@"%i", abs(obj.intValue)];
        
        
        NSString *appendableString = [NSString stringWithFormat:@"%@%@%@%@%@", sign, value, x, degSign, degree];
        [result appendString:appendableString];
        
    }];
    return result;
}
@end
