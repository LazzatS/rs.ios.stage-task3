#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    
    NSMutableString *newString = [NSMutableString string];                          // create an empty mutable string
    
    NSMutableString *givenString1 = [NSMutableString stringWithString:string1];     // create a copy of string 1 to change it
    NSMutableString *givenString2 = [NSMutableString stringWithString:string2];     // create a copy of string 2 to change it
    
    while (givenString1.length != 0 && givenString2.length != 0) {                          // repeate until the string has disappeared
        
        if ([givenString1 characterAtIndex:0] <= [givenString2 characterAtIndex:0]) {       // check if first letter of the string 1 has lower or equal ASCII value in comparison with the first letter of string 2
            
            [newString appendFormat:@"%c", [givenString1 characterAtIndex:0]];              // add the letter with lower ASCII value to a new string
            [givenString1 deleteCharactersInRange:NSMakeRange(0, 1)];                       // delete the letter with lower ASCII value from string 1
            
        } else {                                                                            // check if first letter of the string 2 has lower
                                                                                            // or equal ASCII value in comparison with the first letter of string 1
            
            [newString appendFormat:@"%c", [givenString2 characterAtIndex:0]];              // add the letter with lower ASCII value to a new string
            [givenString2 deleteCharactersInRange:NSMakeRange(0, 1)];                       // delete the letter with lower ASCII value from string 2
            
        }
    }
    
    if (givenString1.length == 0) {                     // if letters of string 1 have all been used
        [newString appendString:givenString2];          // add the remaining string 2 to the new string
    } else if (givenString2.length == 0) {              // if letters of string 2 have all been used
        [newString appendString:givenString1];          // add the remaining string 1 to the new string
    }
    
    return newString;                                   // return the new string
}

@end
