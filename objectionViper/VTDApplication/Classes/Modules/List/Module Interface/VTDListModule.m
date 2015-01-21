//
//  VTDListModule.m
//  objectionViper
//
//  Created by 崔 明辉 on 15/1/20.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "VTDListModule.h"
#import "VTDListWireFrame.h"
#import "VTDListUpcomingItem.h"
#import "VTDListUpcomingItemProvider.h"

@implementation VTDListModule

- (void)configure {
    [self bindClass:[VTDListWireFrame class] inScope:JSObjectionScopeSingleton];
    [self bindClass:[VTDListWireFrame class] toProtocol:@protocol(VTDListWireFrame)];
    [self bindProvider:[[VTDListUpcomingItemProvider alloc] init] toClass:[VTDListUpcomingItem class]];
}

@end
