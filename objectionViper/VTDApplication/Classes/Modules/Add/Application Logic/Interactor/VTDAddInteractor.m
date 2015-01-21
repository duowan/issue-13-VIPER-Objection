//
//  VTDAddInteractor.m
//  objectionViper
//
//  Created by 崔 明辉 on 15/1/21.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "VTDAddInteractor.h"
#import "VTDAddDataManager.h"
#import "VTDTodoItem.h"

@implementation VTDAddInteractor

- (instancetype)init {
    self = [super init];
    if (self) {
        self.dataManager = [[VTDAddDataManager alloc] init];
    }
    return self;
}

- (void)saveNewEntryWithName:(NSString *)name dueDate:(NSDate *)dueDate {
    if (name.length) {
        VTDTodoItem *newEntry = [[VTDTodoItem alloc] init];
        newEntry.name = name;
        newEntry.date = dueDate;
        [self.dataManager addNewEntry:newEntry];
    }
}

@end
