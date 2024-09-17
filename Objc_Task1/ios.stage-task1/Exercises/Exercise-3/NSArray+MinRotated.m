#import "NSArray+MinRotated.h"

@implementation NSArray (MinRotated)

- (NSNumber *)minRotated {
    if (self.count == 0) {
        return nil;
    }

    NSInteger left = 0;
    NSInteger right = self.count - 1;

    // Если массив уже отсортирован без поворотов, то первый элемент минимальный
    if ([self[left] compare:self[right]] != NSOrderedDescending) {
        return self[left];
    }

    // Бинарный поиск
    while (left < right) {
        NSInteger mid = (left + right) / 2;

        if ([self[mid] compare:self[right]] == NSOrderedDescending) {
            // Минимум находится в правой части
            left = mid + 1;
        } else {
            // Минимум находится в левой части, включая mid
            right = mid;
        }
    }

    return self[left];
}

@end
