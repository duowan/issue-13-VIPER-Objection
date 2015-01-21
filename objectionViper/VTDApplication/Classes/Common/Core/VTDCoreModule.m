//
//  VTDCoreModule.m
//  objectionViper
//
//  Created by 崔 明辉 on 15/1/20.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "VTDCoreModule.h"
#import "VTDWireFrame.h"
#import "VTDCoreDataStore.h"
#import "VTDTodoItem.h"
#import "VTDTodoItemProvider.h"

@implementation VTDCoreModule

- (void)configure {
    //singleton define
    [self bindClass:[VTDWireFrame class] inScope:JSObjectionScopeSingleton];
    [self bindClass:[VTDCoreDataStore class] inScope:JSObjectionScopeSingleton];
    //bind class
    [self bindClass:[VTDWireFrame class] toProtocol:@protocol(VTDWireFrame)];
    [self bindClass:[VTDCoreDataStore class] toProtocol:@protocol(VTDCoreDataStore)];
    //bind provider
    [self bindProvider:[[VTDTodoItemProvider alloc] init] toClass:[VTDTodoItem class]];
}

@end
