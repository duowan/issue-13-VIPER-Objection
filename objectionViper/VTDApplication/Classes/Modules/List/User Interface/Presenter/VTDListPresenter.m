//
//  VTDListPresenter.m
//  objectionViper
//
//  Created by 崔 明辉 on 15/1/20.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "VTDListPresenter.h"
#import "VTDListInteractor.h"

@implementation VTDListPresenter

- (instancetype)init {
    self = [super init];
    if (self) {
        self.listInteractor = [[VTDListInteractor alloc] init];
    }
    return self;
}

- (void)updateView {
    [self.listInteractor findUpcomingItem:^{
        if ([self.listInteractor.listData count] == 0) {
            [self.userInterface showNoContents];
        }
        else {
            [self.userInterface reloadTableView];
            [self.userInterface showTableView];
        }
    }];
}

- (void)addNewEntry {
    [VTD[@protocol(VTDAddWireFrame)] presentAddInterfaceFromViewController:self.userInterface];
}

@end
