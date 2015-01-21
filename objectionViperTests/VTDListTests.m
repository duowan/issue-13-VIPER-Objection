//
//  VTDListTests.m
//  objectionViper
//
//  Created by 崔 明辉 on 15/1/21.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "VTDApplication.h"
#import "VTDTodoItem.h"
#import "VTDListUpcomingItem.h"

@interface VTDListTests : XCTestCase

@end

@implementation VTDListTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testUpcomingItemProvider {
    {
        id anObject = [[VTDApplication injector] getObject:[VTDListUpcomingItem class] argumentList:@[]];
        XCTAssert(anObject == nil, @"Pass");
    }
    {
        VTDTodoItem *anModel = [[VTDTodoItem alloc] init];
        anModel.name = @"Test Name";
        anModel.date = [NSDate date];
        id anObject = [[VTDApplication injector] getObject:[VTDListUpcomingItem class] argumentList:@[anModel]];
        XCTAssert([anObject isKindOfClass:[VTDListUpcomingItem class]], @"Pass");
        XCTAssert([[(VTDListUpcomingItem *)anObject title] isEqualToString:anModel.name], @"Pass");
        XCTAssert([[(VTDListUpcomingItem *)anObject dueDate] isEqualToDate:anModel.date], @"Pass");
    }
}

- (void)testUpcomingItemRelation {
    {
        VTDTodoItem *anModel = [[VTDTodoItem alloc] init];
        anModel.name = @"Test Name";
        anModel.date = [NSDate date];
        id anObject = [[VTDApplication injector] getObject:[VTDListUpcomingItem class] argumentList:@[anModel]];
        XCTAssert([(VTDListUpcomingItem *)anObject relation] == VTDListUpcomingItemDateRelationToday, @"Pass");
    }
    {
        VTDTodoItem *anModel = [[VTDTodoItem alloc] init];
        anModel.name = @"Test Name";
        anModel.date = [NSDate dateWithTimeIntervalSinceNow:+86400];
        id anObject = [[VTDApplication injector] getObject:[VTDListUpcomingItem class] argumentList:@[anModel]];
        XCTAssert([(VTDListUpcomingItem *)anObject relation] == VTDListUpcomingItemDateRelationTomorrow, @"Pass");
    }
    {
        VTDTodoItem *anModel = [[VTDTodoItem alloc] init];
        anModel.name = @"Test Name";
        anModel.date = [NSDate dateWithTimeIntervalSinceNow:+86400*7];NSLog(@"%@", anModel.date);
        id anObject = [[VTDApplication injector] getObject:[VTDListUpcomingItem class] argumentList:@[anModel]];
        XCTAssert([(VTDListUpcomingItem *)anObject relation] == VTDListUpcomingItemDateRelationNextWeek, @"Pass");
    }
    {
        VTDTodoItem *anModel = [[VTDTodoItem alloc] init];
        anModel.name = @"Test Name";
        anModel.date = [NSDate distantFuture];
        id anObject = [[VTDApplication injector] getObject:[VTDListUpcomingItem class] argumentList:@[anModel]];
        XCTAssert([(VTDListUpcomingItem *)anObject relation] == VTDListUpcomingItemDateRelationOutOfRange, @"Pass");
    }
}

//- (void)testExample {
//    // This is an example of a functional test case.
//    XCTAssert(YES, @"Pass");
//}
//
//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

@end
