//
//  VTDListUpcomingItem.h
//  objectionViper
//
//  Created by 崔 明辉 on 15/1/21.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    VTDListUpcomingItemDateRelationToday,
    VTDListUpcomingItemDateRelationTomorrow,
    VTDListUpcomingItemDateRelationLaterThisWeek,
    VTDListUpcomingItemDateRelationNextWeek,
    VTDListUpcomingItemDateRelationOutOfRange
}VTDListUpcomingItemDateRelation;

@interface VTDListUpcomingItem : NSObject

@property (nonatomic, readonly, assign) VTDListUpcomingItemDateRelation relation;
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, strong) NSDate *dueDate;

@end
