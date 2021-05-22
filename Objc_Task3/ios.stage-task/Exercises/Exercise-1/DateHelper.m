#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    
    NSDateFormatter *monthFormatter = [[NSDateFormatter alloc] init];   // use date formatter
    [monthFormatter setDateFormat:@"MMM"];                              // use the formate of full month name
    
    if (monthNumber <= 0 || monthNumber >= 13) {                        // month cannot be negative or 0th or higher than 12
        return nil;                                                     // return nill in the case wrong month number is provided and exit
    }
    
    // use month symbols to decode the month number in the order - months start from 0 index i.e. January is NOT 1 but 0 index month
    NSString *monthString = [[monthFormatter monthSymbols] objectAtIndex:(monthNumber - 1)];
    
    return monthString;                                                 // return month name
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];        // allocate and initialize memory for date formatter
    [dateFormatter setDateFormat:@"yyyy-MM-DDEEEEHH:mm:ssZ"];               // use the format of the given string
    
    NSDate *day = [dateFormatter dateFromString:date];                      // convert given string to date
    
    NSCalendar *calendar = [NSCalendar currentCalendar];                    // use calendar
    NSDateComponents *components = [calendar components:NSCalendarUnitDay fromDate:day];    // find day component of the calendar
    
    return [components day];                                                // return the day of the given string
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    return nil;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    return NO;
}

@end
