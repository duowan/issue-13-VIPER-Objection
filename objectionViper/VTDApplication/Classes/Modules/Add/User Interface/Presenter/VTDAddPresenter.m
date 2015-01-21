//
//  VTDAddPresenter.m
//  objectionViper
//
//  Created by 崔 明辉 on 15/1/20.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "VTDAddPresenter.h"

@implementation VTDAddPresenter

- (instancetype)init{
    self = [super init];
    if (self) {
        self.addInteractor = [[VTDAddInteractor alloc] init];
    }
    return self;
}

- (void)cancel {
    [VTD[@protocol(VTDAddWireFrame)] dismissAddInterface:self.userInterface];
}

- (void)save {
    [self.addInteractor saveNewEntryWithName:self.userInterface.eventTextField.text
                                     dueDate:self.userInterface.eventDueDatePicker.date];
    [VTD[@protocol(VTDAddWireFrame)] dismissAddInterface:self.userInterface];
    [[NSNotificationCenter defaultCenter] postNotificationName:kVTDAddModuleDidAddItemNotification object:nil];
}

@end
