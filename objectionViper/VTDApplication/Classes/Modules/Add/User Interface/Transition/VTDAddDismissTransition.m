//
//  VTDAddDismissTransition.m
//  objectionViper
//
//  Created by 崔 明辉 on 15/1/20.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "VTDAddDismissTransition.h"
#import "VTDAddViewController.h"

@implementation VTDAddDismissTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.50;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];

    UIView *containerView = [transitionContext containerView];
    UIView *maskView = [containerView viewWithTag:999];
    
    CGRect fromViewTargetFrame = fromViewController.view.frame;
    fromViewTargetFrame.origin.y = -CGRectGetHeight(fromViewTargetFrame) - 10.0;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0.0f
         usingSpringWithDamping:0.64f
          initialSpringVelocity:0.22f
                        options:UIViewAnimationCurveEaseIn|UIViewAnimationOptionAllowAnimatedContent
                     animations:^{
                         maskView.alpha = 0.0;
                         fromViewController.view.frame = fromViewTargetFrame;
                     }
                     completion:^(BOOL finished) {
                         [fromViewController.view removeFromSuperview];
                         [maskView removeFromSuperview];
                         [transitionContext completeTransition:YES];
                     }];
}

@end
