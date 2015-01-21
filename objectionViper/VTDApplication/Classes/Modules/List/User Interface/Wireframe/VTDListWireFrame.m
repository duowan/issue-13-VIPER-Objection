//
//  VTDListWireFrame.m
//  objectionViper
//
//  Created by 崔 明辉 on 15/1/20.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "VTDListWireFrame.h"
#import "VTDWireFrame.h"
#import "VTDListViewController.h"
#import "VTDListPresenter.h"
#import "VTDListTableViewCell.h"
#import "VTDListTableViewCellPresenter.h"

@implementation VTDListWireFrame

- (void)presentListViewControllerToWindow:(UIWindow *)window {
    [VTD[@protocol(VTDWireFrame)] presentRootViewControllerToWindow:window
                                                    viewControllers:@[[self listViewController]]];
}

- (VTDListViewController *)listViewController {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"VTD" bundle:[NSBundle mainBundle]];
    VTDListViewController *listViewController = [storyBoard instantiateViewControllerWithIdentifier:@"VTDListViewController"];
    listViewController.eventHandler = [[VTDListPresenter alloc] init];
    listViewController.eventHandler.userInterface = listViewController;
    return listViewController;
}

- (UITableViewCell *)configureCellForListTableView:(UITableView *)tableView
                                  interactorObject:(id)interactorObject {
    static NSString *cellIdentifier = @"Cell";
    VTDListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [self listTableViewCell];
    }
    return cell;
}

- (VTDListTableViewCell *)listTableViewCell {
    VTDListTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"VTDListTableViewCell" owner:nil options:nil] firstObject];
    cell.eventHandler = [[VTDListTableViewCellPresenter alloc] init];
    cell.eventHandler.userInterface = cell;
    return cell;
}

@end
