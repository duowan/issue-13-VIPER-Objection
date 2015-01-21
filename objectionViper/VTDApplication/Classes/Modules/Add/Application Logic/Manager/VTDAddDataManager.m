//
//  VTDAddDataManager.m
//  objectionViper
//
//  Created by 崔 明辉 on 15/1/21.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "VTDAddDataManager.h"
#import "VTDManagedTodoItem.h"

@implementation VTDAddDataManager

- (void)addNewEntry:(VTDTodoItem *)todoItem {
    VTDManagedTodoItem *newEntry = [VTD[@protocol(VTDCoreDataStore)] newTodoItem];
    newEntry.name = todoItem.name;
    newEntry.date = todoItem.date;
    
    [VTD[@protocol(VTDCoreDataStore)] saveWithCompletionBlock:nil failureBlock:nil];
}

@end
