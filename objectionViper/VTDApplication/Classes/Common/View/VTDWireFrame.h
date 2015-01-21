//
//  VTDWireFrame.h
//  objectionViper
//
//  Created by 崔 明辉 on 15/1/20.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VTDWireFrame : NSObject<VTDWireFrame>

- (void)presentRootViewControllerToWindow:(UIWindow *)window viewControllers:(NSArray *)viewControllers;

@end
