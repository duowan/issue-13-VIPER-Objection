//
//  VTDListTableViewCell.h
//  objectionViper
//
//  Created by 崔 明辉 on 15/1/20.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VTDListTableViewCellPresenter.h"

@class VTDListTableViewCellPresenter;

@interface VTDListTableViewCell : UITableViewCell

@property (nonatomic, strong) VTDListTableViewCellPresenter *eventHandler;

@end
