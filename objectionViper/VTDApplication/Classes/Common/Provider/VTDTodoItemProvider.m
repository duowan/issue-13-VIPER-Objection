//
//  VTDTodoItemProvider.m
//  objectionViper
//
//  Created by 崔 明辉 on 15/1/21.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "VTDTodoItemProvider.h"
#import "VTDTodoItem.h"
#import "VTDManagedTodoItem.h"

@implementation VTDTodoItemProvider

- (id)provide:(JSObjectionInjector *)context arguments:(NSArray *)arguments {
    if ([arguments count] >= 1) {
        if ([[arguments firstObject] isKindOfClass:[VTDManagedTodoItem class]]) {
            VTDManagedTodoItem *managedItem = [arguments firstObject];
            VTDTodoItem *modelItem = [[VTDTodoItem alloc] init];
            modelItem.name = managedItem.name;
            modelItem.date = managedItem.date;
            return modelItem;
        }
    }
    return nil;
}

@end
