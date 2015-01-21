//
//  VTDAddPresentationTransition.m
//  objectionViper
//
//  Created by 崔 明辉 on 15/1/20.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "VTDAddPresentationTransition.h"
#import "VTDAddViewController.h"

@implementation VTDAddPresentationTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.50;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    VTDAddViewController *toViewController = (VTDAddViewController *)[transitionContext
                                                                      viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *maskView = [self maskView];
    maskView.alpha = 0.0;
    [maskView addGestureRecognizer:[[UITapGestureRecognizer alloc]
                                    initWithTarget:toViewController.eventHandler action:@selector(cancel)]];
    
    UIView *containerView = [transitionContext containerView];
//    [containerView addSubview:fromViewController.view];
    [containerView addSubview:maskView];
    [containerView addSubview:toViewController.view];
    
    toViewController.view.frame = CGRectMake(0, 0, 300, 300);
    
    CGRect toViewOriginFrame = CGRectMake(
                                          (CGRectGetWidth(fromViewController.view.bounds) - CGRectGetWidth(toViewController.view.bounds)) / 2.0 ,
                                         -CGRectGetHeight(toViewController.view.bounds),
                                          CGRectGetWidth(toViewController.view.bounds),
                                          CGRectGetHeight(toViewController.view.bounds)
                                          );
    
    CGRect toViewTargetFrame = CGRectMake(
                                          (CGRectGetWidth(fromViewController.view.bounds) - CGRectGetWidth(toViewController.view.bounds)) / 2.0 ,
                                          (CGRectGetHeight(fromViewController.view.bounds) - CGRectGetHeight(toViewController.view.bounds)) / 2.0,
                                          CGRectGetWidth(toViewController.view.bounds),
                                          CGRectGetHeight(toViewController.view.bounds)
                                          );
    
    toViewController.view.frame = toViewOriginFrame;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0.0f
         usingSpringWithDamping:0.64f
          initialSpringVelocity:0.22f
                        options:UIViewAnimationCurveEaseIn|UIViewAnimationOptionAllowAnimatedContent
                     animations:^{
                         maskView.alpha = 1.0;
                         toViewController.view.frame = toViewTargetFrame;
    }
                     completion:^(BOOL finished) {
                         maskView.alpha = 1.0;
                         toViewController.view.frame = toViewTargetFrame;
                         [transitionContext completeTransition:YES];
    }];
}

- (UIView *)maskView {
    UIView *maskView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    maskView.tag = 999;
    maskView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.65];
    maskView.userInteractionEnabled = YES;
    return maskView;
}

@end
