#import "NumberConverter.h"

@implementation NumberConverter

- (NSArray *)numberConverter:(NSNumber *)number {
    // Convert NSNumber to NSString
    NSString *numberString = number.stringValue;

    // Initialize an NSMutableArray with fix length to hold the result
    NSMutableArray<NSString *> *resultArray = [NSMutableArray arrayWithCapacity: numberString.length];
    
    // Iterate over each character in the string
    for (NSUInteger i = 0; i < numberString.length; i++) {
        unichar character = [numberString characterAtIndex:i];
        NSString *digitString = [NSString stringWithFormat:@"%C", character];
        
        // Add the digit to the result array
        if ((character >= '0' && character <= '9')) {
            [resultArray insertObject:digitString atIndex:0];
        }
    }
    return [resultArray copy]; // Return an immutable NSArray
}

@end
