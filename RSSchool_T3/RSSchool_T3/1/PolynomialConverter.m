#import "PolynomialConverter.h"
        
@implementation PolynomialConverter
- (NSString*)convertToStringFrom:(NSArray <NSNumber*>*)numbers {
    if([numbers isEqual:@[]]) return nil;
//    if(numbers.count == 1) return [NSString stringWithFormat:@"%ix", [numbers objectAtIndex:0].intValue];
    NSUInteger polyDegree = [numbers count] - 1;
    __block NSMutableString *result = [NSMutableString new];
        
    [numbers enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // case of 0
        // case of 1
        
        
//        if(idx == 0) {
//            NSString *appendableString = obj.intValue > 0 ?
//            [NSString stringWithFormat:@"%ix^%lu", obj.intValue, polyDegree] :
//            [NSString stringWithFormat:@"-%ix^%lu", obj.intValue, polyDegree];
//            [result appendString:appendableString];
//            return;
//        };
        
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
        
//    for (NSNumber *num in numbers) {
//        if([num intValue] != 0){
//            NSUInteger curDegree = degree - [numbers indexOfObject:num];
//            result = [result stringByAppendingString:[NSString stringWithFormat:@"%ix^%i",[num intValue], curDegree]];
//        }
//    };
        
    return result;
}
@end
