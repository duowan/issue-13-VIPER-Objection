//
//  VTDListTableViewCell.m
//  objectionViper
//
//  Created by 崔 明辉 on 15/1/20.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "VTDListTableViewCell.h"

@interface VTDListTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *eventNameLabel;

@end

@implementation VTDListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setEventNameLabelText:(NSString *)text {
    self.eventNameLabel.text = text;
}

@end
