//
//  NSArray+VTDObjectsCollection.m
//  objectionViper
//
//  Created by 崔 明辉 on 15/1/21.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "NSArray+VTDObjectsCollector.h"

@implementation NSArray (VTDObjectCollector)

- (void)VTD_collectArrayAsObject:(id)object completionBlock:(void (^)(NSArray *))completionBlock {
    __block NSMutableArray *collectedArray = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id collectedObject = [VTD getObject:object argumentList:@[obj]];
        if (collectedObject != nil) {
            [collectedArray addObject:collectedObject];
        }
    }];
    if (completionBlock) {
        completionBlock([collectedArray copy]);
    }
}

@end
