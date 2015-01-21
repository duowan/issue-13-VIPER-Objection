//
//  VTDListInteractor.m
//  objectionViper
//
//  Created by 崔 明辉 on 15/1/21.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "VTDListInteractor.h"
#import "VTDListDataManager.h"

@interface VTDListInteractor ()

@property (nonatomic, strong) id dataManager;

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
    if (completionBlock) {
        completionBlock();
    }
}

@end
