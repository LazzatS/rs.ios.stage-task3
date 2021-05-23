#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    
    NSMutableArray *givenArray = [NSMutableArray arrayWithArray:ratingArray];       // mutate given array of numbers
    
    int ascendingArrayCounter = 0;                              // count of teams with "growing" trend
    int descendingArrayCounter = 0;                             // count of teams with "falling" trend
    int result = 0;                                             // total number of teams
    
    for (int i = 0; i < givenArray.count; i++) {                            // take base integer at index of the array
        for (int j = i + 1; j < givenArray.count; j++) {                    // compare it with every following index's integer
            
            int iValue = [givenArray[i] intValue];                          // take int value of the base index
            int jValue = [givenArray[j] intValue];                          // take int value of the following indexes
            
            if (iValue < jValue) {                                          // if the value at following index is higher than previous
                
                for (int k = j + 1; k < givenArray.count; k++) {            // search for the third index for "growing" trend
                    int kValue = [givenArray[k] intValue];                  // take int value of the following indexes
                        
                    if (jValue < kValue) {                                  // if the value at following index is higher than previous
                        ascendingArrayCounter = ascendingArrayCounter + 1;  // count it as a team
                    }
                }
            } else if (jValue < iValue) {                                   // if the value at following index is lower than previous
                
                for (int k = j + 1; k < givenArray.count; k++) {            // search for the third index for "falling" trend
                    int kValue = [givenArray[k] intValue];                  // take int value of the following indexes
                        
                    if (kValue < jValue) {                                  // if the value at following index is lower than previous
                        descendingArrayCounter = descendingArrayCounter + 1;    // count it as a team
                    }
                }
            }
        }
    }
    
    result = ascendingArrayCounter + descendingArrayCounter;                // count total number of teams
    
    return result;      // return the result
    
}

@end
