//
//  VTDListInteractor.m
//  objectionViper
//
//  Created by 崔 明辉 on 15/1/21.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "VTDListInteractor.h"
#import "VTDListDataManager.h"
#import "VTDListUpcomingItem.h"

@interface VTDListInteractor ()

@property (nonatomic, strong) id dataManager;

@property (nonatomic, readwrite) NSDictionary *listData;/** VTDListUpcomingItemDateRelation : NSArray **/

@end

@implementation VTDListInteractor

- (instancetype)init {
    self = [super init];
    if (self) {
        self.dataManager = [[VTDListDataManager alloc] init];
    }
    return self;
}

- (void)findUpcomingItem:(void (^)())completionBlock {
    [self.dataManager fetchUpcomingTodoItems:^(NSArray *items) {
        [items VTD_collectArrayAsObject:[VTDListUpcomingItem class] completionBlock:^(NSArray *collectedArray) {
            [self updateListData:collectedArray];
            if (completionBlock) {
                completionBlock();
            }
        }];
    }];
}

- (void)updateListData:(NSArray *)upcomingItems {
    //re-organize items
    NSMutableDictionary *listData = [NSMutableDictionary dictionary];
    [upcomingItems enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        VTDListUpcomingItem *item = obj;
        NSString *numberKey = [NSString stringWithFormat:@"%d", item.relation];
        if (listData[numberKey] == nil) {
            listData[numberKey] = [NSMutableArray array];
        }
        NSMutableArray *sectionArray = listData[numberKey];
        [sectionArray addObject:item];
    }];
    [listData enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [listData setObject:[obj copy] forKey:key];
    }];
    self.listData = [listData copy];
}

@end
