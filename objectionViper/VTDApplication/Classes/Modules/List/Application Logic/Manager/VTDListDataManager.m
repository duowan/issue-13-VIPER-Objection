//
//  VTDListDataManager.m
//  objectionViper
//
//  Created by 崔 明辉 on 15/1/21.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "VTDListDataManager.h"
#import "VTDTodoItem.h"

@implementation VTDListDataManager

- (void)fetchUpcomingTodoItems:(void (^)(NSArray *))completionBlock {
    NSDate *startDate = [NSDate date];
    NSDate *endDate = [NSDate dateWithTimeIntervalSinceNow:86400*14];
    NSPredicate *upcomingPredicate = [NSPredicate predicateWithFormat:@"(date > %@) AND (date<=%@)",
                                      startDate,
                                      endDate];
    [VTD[@protocol(VTDCoreDataStore)]
     fetchEntriesWithEntryName:@"TodoItem"
     predicate:upcomingPredicate
     sortDescriptors:@[]
     completionBlock:^(NSArray *results) {
         [results VTD_collectArrayAsObject:[VTDTodoItem class] completionBlock:^(NSArray *collectedArray) {
             if (completionBlock) {
                 completionBlock(collectedArray);
             }
         }];
    }];
}

@end
