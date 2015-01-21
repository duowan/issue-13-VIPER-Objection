//
//  VTDAddModule.m
//  objectionViper
//
//  Created by 崔 明辉 on 15/1/20.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "VTDAddModule.h"
#import "VTDAddWireFrame.h"

@implementation VTDAddModule

- (void)configure {
    [self bindClass:[VTDAddWireFrame class] inScope:JSObjectionScopeSingleton];
    [self bindClass:[VTDAddWireFrame class] toProtocol:@protocol(VTDAddWireFrame)];
}

@end
