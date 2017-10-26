//
//  TransmitionManager.swift
//  CustomPresentAnimationDemo
//
//  Created by ebt on 平成29-10-26.
//  Copyright © 平成29年 USTC. All rights reserved.
//

import UIKit

class TransmitionManager: NSObject, UIViewControllerTransitioningDelegate {
    
    let presentAnimtor  = PresentAnimator()
    let dismissAnimator = DimissAnimator()
    
    var interactive: UIPercentDrivenInteractiveTransition!
    
    var toViewController: UIViewController! {
        didSet {
            containerView = toViewController.view.superview
        }
    }
    
    var containerView: UIView! {
        didSet {
            let pan = UIScreenEdgePanGestureRecognizer(
                target: self,
                action: #selector(handlePanGesutre(pan:))
            )
            
            pan.edges = .left
            
            containerView.addGestureRecognizer(pan)
        }
    }
    
    @objc func handlePanGesutre(pan: UIPanGestureRecognizer) {
        
        switch pan.state {
        case .began:
            interactive = UIPercentDrivenInteractiveTransition()
            toViewController.dismiss(animated: true, completion: nil)
        case .changed:
            let translation = pan.translation(in: containerView).x
            let progress = translation / containerView.bounds.width
            
            interactive?.update(progress)
        case .ended:
            if pan.velocity(in: containerView).x > 0 {
                interactive?.finish()
            } else {
                interactive?.cancel()
            }
            interactive = nil
        default:
            interactive?.cancel()
            interactive = nil
        }
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return presentAnimtor
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return dismissAnimator
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {

        return interactive
    }
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        
        return interactive
    }

}
