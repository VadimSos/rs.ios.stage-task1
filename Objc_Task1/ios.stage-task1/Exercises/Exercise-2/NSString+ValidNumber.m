#import "NSString+ValidNumber.h"

@implementation NSString (ValidNumber)
static NSNumberFormatter *customFormatter = nil;

+ (NSNumberFormatter *)numberFormatter {
    if (customFormatter) { return customFormatter; }
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    customFormatter = formatter;
    return customFormatter;
}

- (BOOL)isValidNumber {
    // basic solution
//    NSString *numberPattern = @"^[-+]?[0-9]*\\.?[0-9]+$";
//    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberPattern];
//    return [numberTest evaluateWithObject:self];
    
    // optimized solution
//    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
//    formatter.numberStyle = NSNumberFormatterDecimalStyle;
//    NSNumber *number = [customFormatter numberFromString:self];
//    return number != nil;
    
    // more optimized solution
    [NSString numberFormatter];
    NSNumber *number = [customFormatter numberFromString:self];
    return number != nil;
}

@end
