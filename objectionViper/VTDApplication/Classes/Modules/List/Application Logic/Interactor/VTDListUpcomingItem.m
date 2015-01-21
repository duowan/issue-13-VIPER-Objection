//
//  VTDListUpcomingItem.m
//  objectionViper
//
//  Created by 崔 明辉 on 15/1/21.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "VTDListUpcomingItem.h"

@interface VTDListUpcomingItem ()

@property (nonatomic, readwrite, copy) NSString *title;
@property (nonatomic, readwrite, strong) NSDate *dueDate;

@end

@implementation VTDListUpcomingItem

- (VTDListUpcomingItemDateRelation)relation {
    NSDate *today = [NSDate date];
    NSInteger todaySecs = (int)[today timeIntervalSince1970] % 86400;
    NSTimeInterval todayStandardTime = [today timeIntervalSince1970] - todaySecs;
    
    //Thursday -> Monday, Week Start at Monday.
    NSInteger weekSecs = ((int)[today timeIntervalSince1970] - 86400 * 4) % (86400 * 7);
    NSTimeInterval weekStandardTime = [today timeIntervalSince1970] - weekSecs;
    
    NSTimeInterval dayInteval = [self.dueDate timeIntervalSince1970] - todayStandardTime;
    NSTimeInterval weekInteval = [self.dueDate timeIntervalSince1970] - weekStandardTime;
    if (dayInteval < 86400) {
        return VTDListUpcomingItemDateRelationToday;
    }
    else if (dayInteval < 86400 * 2) {
        return VTDListUpcomingItemDateRelationTomorrow;
    }
    else if (weekInteval < 86400 * 7) {
        return VTDListUpcomingItemDateRelationLaterThisWeek;
    }
    else if (weekInteval < 86400 * 14) {
        return VTDListUpcomingItemDateRelationNextWeek;
    }
    else {
        return VTDListUpcomingItemDateRelationOutOfRange;
    }
}

@end
