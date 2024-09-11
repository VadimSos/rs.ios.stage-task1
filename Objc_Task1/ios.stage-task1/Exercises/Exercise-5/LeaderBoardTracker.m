#import "LeaderBoardTracker.h"

@interface LeaderBoardTracker()

@property (nonatomic, strong) NSArray <NSNumber *> *playersPlaces;

@end

@implementation LeaderBoardTracker

- (NSArray <NSNumber *> *)trackLeaderBoard:(NSArray <NSNumber *> *)rankedArray
                               playerArray:(NSArray <NSNumber *> *)playerArray {
    if (rankedArray.count == 0) {
        // If ranked array is empty, player always ranks 1st in every game
        NSMutableArray *allFirstRanks = [NSMutableArray array];
        for (NSInteger i = 0; i < playerArray.count; i++) {
            [allFirstRanks addObject:@1];
        }
        return allFirstRanks;
    }
    
    if (playerArray.count == 0) {
        // If player array is empty, return an empty array
        return @[];
    }
    
    // Remove duplicates from rankedArray and sort it in descending order
    NSOrderedSet *rankedSet = [NSOrderedSet orderedSetWithArray:rankedArray];
    NSArray *uniqueRanked = [rankedSet sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO]]];
    
    NSMutableArray *playerRanks = [NSMutableArray array];
    
    // Iterate over each player's score
    for (NSNumber *playerScore in playerArray) {
        NSInteger rank = 1;
        BOOL rankAssigned = NO;
        
        // Compare player's score with the ranked list
        for (NSInteger i = 0; i < uniqueRanked.count; i++) {
            NSNumber *currentRankedScore = uniqueRanked[i];
            if (playerScore.integerValue >= currentRankedScore.integerValue) {
                [playerRanks addObject:@(rank)];
                rankAssigned = YES;
                break;
            }
            rank++;
        }
        
        // If player's score is less than all scores in rankedArray
        if (!rankAssigned) {
            [playerRanks addObject:@(rank)];
        }
    }
    
    return playerRanks;
}

@end
