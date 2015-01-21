//
//  VTDListUpcomingItemProvider.m
//  objectionViper
//
//  Created by 崔 明辉 on 15/1/21.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "VTDListUpcomingItemProvider.h"
#import "VTDListUpcomingItem.h"
#import "VTDTodoItem.h"

@interface VTDListUpcomingItem (writable)

@property (nonatomic, readwrite, copy) NSString *title;
@property (nonatomic, readwrite, strong) NSDate *dueDate;

@end

@implementation VTDListUpcomingItemProvider

- (id)provide:(JSObjectionInjector *)context arguments:(NSArray *)arguments {
    if ([[arguments firstObject] isKindOfClass:[VTDTodoItem class]]) {
        VTDTodoItem *modelItem = [arguments firstObject];
        VTDListUpcomingItem *anItem = [[VTDListUpcomingItem alloc] init];
        anItem.title = modelItem.name;
        anItem.dueDate = modelItem.date;
        return anItem;
    }
    return nil;
}

@end
