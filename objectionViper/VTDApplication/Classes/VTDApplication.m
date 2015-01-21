//
//  VTDApplication.m
//  objectionViper
//
//  Created by 崔 明辉 on 15/1/20.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "VTDApplication.h"
#import "VTDCoreModule.h"
#import "VTDListModule.h"
#import "VTDAddModule.h"

@implementation VTDApplication

+ (JSObjectionInjector *)injector {
    static JSObjectionInjector *injector;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        injector = [JSObjection createInjectorWithModules:
                    [[VTDCoreModule alloc] init],
                    [[VTDListModule alloc] init],
                    [[VTDAddModule alloc] init],
                    nil];
    });
    return injector;
}

@end
