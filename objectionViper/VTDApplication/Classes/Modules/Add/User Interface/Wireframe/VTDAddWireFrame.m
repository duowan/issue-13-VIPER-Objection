//
//  VTDAddWireFrame.m
//  objectionViper
//
//  Created by 崔 明辉 on 15/1/20.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "VTDAddWireFrame.h"
#import "VTDAddViewController.h"
#import "VTDAddPresenter.h"
#import "VTDAddPresentationTransition.h"
#import "VTDAddDismissTransition.h"

@interface VTDAddWireFrame ()<UIViewControllerTransitioningDelegate>

@end

@implementation VTDAddWireFrame

- (void)presentAddInterfaceFromViewController:(UIViewController *)viewController {
    VTDAddViewController *addViewController = [self addViewController];
    addViewController.modalPresentationStyle = UIModalPresentationCustom;
    addViewController.transitioningDelegate = self;
    [viewController presentViewController:addViewController animated:YES completion:nil];
}

- (VTDAddViewController *)addViewController {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"VTD" bundle:[NSBundle mainBundle]];
    VTDAddViewController *addViewController = [storyBoard instantiateViewControllerWithIdentifier:@"VTDAddViewController"];
    addViewController.eventHandler = [[VTDAddPresenter alloc] init];
    addViewController.eventHandler.userInterface = addViewController;
    return addViewController;
}

- (void)dismissAddInterface:(UIViewController *)addViewController {
    addViewController.modalPresentationStyle = UIModalPresentationCustom;
    addViewController.transitioningDelegate = self;
    [addViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[VTDAddDismissTransition alloc] init];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[VTDAddPresentationTransition alloc] init];
}

@end
