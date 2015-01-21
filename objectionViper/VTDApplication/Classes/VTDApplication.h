//
//  VTDApplication.h
//  objectionViper
//
//  Created by 崔 明辉 on 15/1/20.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Objection/Objection.h>

//Protocols
#import "VTDListProtocol.h"
#import "VTDCoreProtocol.h"
#import "VTDAddProtocol.h"

//Categories
#import "NSArray+VTDObjectsCollector.h"

#define VTD [VTDApplication injector]

@interface VTDApplication : NSObject

+ (JSObjectionInjector *)injector;

@end
