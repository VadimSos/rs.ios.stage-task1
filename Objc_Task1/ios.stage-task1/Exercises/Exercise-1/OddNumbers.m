//
//  OddNumbers.m
//  ios.stage-task1
//
//  Created by Alex Tsybulko on 4.05.21.
//

#import <Foundation/Foundation.h>
#import "OddNumbers.h"

@implementation OddNumbers

- (NSInteger)oddNumbers:(NSArray <NSNumber *> *)array {
    NSInteger oddCount = 0;

    for (NSNumber *number in array) {
        if (number.integerValue % 2 != 0) {
            oddCount++;
        }
    }

    return oddCount;
    
    // solution on NSNumbers
//    NSNumber *oddCount = @0;
//
//    for (NSNumber *number in array) {
//        if ([number integerValue] % 2 != 0) {
//            NSInteger incrementedValue = [oddCount integerValue] + 1;
//            oddCount = @(incrementedValue);
//        }
//    }
//    return [oddCount integerValue];
}


// optimized solution (basic + updated)
- (NSInteger)oddNumbersOptimize:(nonnull NSArray <NSNumber *> *)array {
//    return [[array filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id  _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
//            return [evaluatedObject integerValue] % 2 != 0;
//        }]] count];
    
    return [[array filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(NSNumber *number, NSDictionary *bindings) {
        return number.integerValue % 2 != 0;
    }]] count];
}

@end
