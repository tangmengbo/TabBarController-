//
//  Transformer.m
//  MyPush
//
//  Created by pbyi on 17/3/25.
//  Copyright © 2017年 pbyi. All rights reserved.
//

#import "TabBar_Transformer.h"
#import "SJTabBarController.h"


@implementation TabBar_Transformer

- (instancetype)init
{
    self = [super init];
    if (self) {
        _preIndex = 0;
        _selectedIndex = 0;
    }
    return self;
}

//UITabBarControllerDelegate
- (id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController animationControllerForTransitionFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    SJTabBarController *tabVC = (SJTabBarController *)tabBarController;
    return tabVC.transform;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.33;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    NSLog(@"Animation begin... ... ");
    // 获取fromVc和toVc
    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *fromView = [[UIView alloc] init];;
    UIView *toView = [[UIView alloc] init];
    
    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {
        // fromVc 的view
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        // toVc的view
        toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    }else {
        // fromVc 的view
        fromView = fromVc.view;
        // toVc的view
        toView =toVc.view;
    }
    
    CGFloat x = [UIScreen mainScreen].bounds.size.width;
    if ([toVc.title isEqualToString:@"owner"]) {
        x = -x;//根据title判断是从哪个控制器跳转到哪个控制器 设置动画的方向
    }
    else if ([toVc.title isEqualToString:@"home"]&&[fromVc.title isEqualToString:@"notice"])
    {
         x = -x;
    }
    
    // 转场环境
    UIView *containView = [transitionContext containerView];
    toView.frame = CGRectMake(-x, 0, containView.frame.size.width, containView.frame.size.height);
    
    [containView addSubview:fromView];
    [containView addSubview:toView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromView.transform = CGAffineTransformTranslate(fromView.transform, x, 0);
        toView.transform = CGAffineTransformTranslate(toView.transform, x, 0);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
        
    }];
    
    
}

@end
