#import "NSString+ValidNumber.h"

@implementation NSString (ValidNumber)

- (BOOL)isValidNumber {
    // basic solution
//    NSString *numberPattern = @"^[-+]?[0-9]*\\.?[0-9]+$";
//    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberPattern];
//    return [numberTest evaluateWithObject:self];
    
    // optimized solution
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *number = [formatter numberFromString:self];
    return number != nil;
}

@end
