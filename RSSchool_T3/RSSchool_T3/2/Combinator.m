#import "Combinator.h"

@implementation Combinator
- (NSNumber*)chechChooseFromArray:(NSArray <NSNumber*>*)array {
    
    NSInteger choicesCount = [array objectAtIndex:1].intValue;
    NSInteger binomValue = [array objectAtIndex:0].intValue;
    NSInteger x = 1;
    NSInteger currentValue = 1;
    
    
    // computing with multiplicative formula
    while(currentValue < binomValue) {
        currentValue =  currentValue * (choicesCount + 1 - x) / x;
        if(currentValue == 0) return nil;
        if(currentValue == binomValue) break;
        x++;
    }
    
    NSLog(@"%d",[@"2a0" intValue]);
    
    return currentValue == binomValue ? [[NSNumber alloc] initWithLong:x] : nil;
}
@end
