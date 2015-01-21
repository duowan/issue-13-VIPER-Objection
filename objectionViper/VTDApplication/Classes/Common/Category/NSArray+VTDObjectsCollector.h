//
//  NSArray+VTDObjectsCollection.h
//  objectionViper
//
//  Created by 崔 明辉 on 15/1/21.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (VTDObjectCollector)

- (void)VTD_collectArrayAsObject:(id)object completionBlock:(void (^)(NSArray *collectedArray))completionBlock;

@end
