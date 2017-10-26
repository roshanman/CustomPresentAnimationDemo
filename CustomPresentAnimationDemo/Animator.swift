//
//  Animator.swift
//  CustomPresentAnimationDemo
//
//  Created by ebt on 平成29-10-26.
//  Copyright © 平成29年 USTC. All rights reserved.
//

import UIKit

class PresentAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard
            let fromView = transitionContext.viewController(forKey: .from)?.view,
            let toView   = transitionContext.viewController(forKey: .to)?.view
        else {
            return
        }

        let duration  = transitionDuration(using: transitionContext)
        let container = transitionContext.containerView

        let width = container.bounds.width
        let offScreenRight = CGAffineTransform(translationX: width, y: 0)
        let offScreenLeft  = CGAffineTransform(translationX: -width, y: 0)

        container.addSubview(toView)
        container.addSubview(fromView)
        
        toView.transform = offScreenRight
        
        UIView.animate(
            withDuration: duration,
            delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0.8,
            options: [],
            animations: { 
                fromView.transform = offScreenLeft
                toView.transform   = .identity
            },
            completion: { finish in
                transitionContext.completeTransition(true)
            }
        )
    }
}

class DimissAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard
            let fromView = transitionContext.viewController(forKey: .from)?.view,
            let toView   = transitionContext.viewController(forKey: .to)?.view
        else {
            return
        }
        
        let duration  = transitionDuration(using: transitionContext)
        let container = transitionContext.containerView
        
        let width = container.bounds.width
        let offScreenRight = CGAffineTransform(translationX: -width, y: 0)
        let offScreenLeft  = CGAffineTransform(translationX: width, y: 0)
        
        container.addSubview(toView)
        container.addSubview(fromView)
        
        toView.transform = offScreenRight
        
        UIView.animate(
            withDuration: duration,
            animations: {
                fromView.transform = offScreenLeft
                toView.transform   = .identity
            },
            completion: { finish in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        )
    }
}

