//
//  VTDWireFrame.m
//  objectionViper
//
//  Created by 崔 明辉 on 15/1/20.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "VTDWireFrame.h"

@implementation VTDWireFrame

- (void)presentRootViewControllerToWindow:(UIWindow *)window viewControllers:(NSArray *)viewControllers {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"VTD" bundle:[NSBundle mainBundle]];
    UINavigationController *navigationController = [storyBoard instantiateInitialViewController];
    [navigationController setViewControllers:viewControllers animated:NO];
    [window setRootViewController:navigationController];
}

@end
