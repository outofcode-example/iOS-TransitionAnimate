//
//  ViewController.swift
//  TransitionAnimateTest
//
//  Created by DH on 2018. 6. 24..
//  Copyright © 2018년 dh. All rights reserved.
//

import UIKit

class ViewController : UIViewController {
    
    @IBOutlet private weak var nextButton: UIButton!
    
    private lazy var transition: CircleTransition = {
        let transition = CircleTransition()
        transition.startPoint = nextButton.center
        transition.circleColor = nextButton.backgroundColor ?? UIColor.black
        return transition
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.cornerRadius = nextButton.frame.size.width / 2
    }

    @IBAction func didClickNext(_ sender: Any) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Present")
        viewController.transitioningDelegate = self
        viewController.modalPresentationStyle = .custom
        
        present(viewController, animated: true, completion: nil)
    }
}

extension ViewController : UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        return transition
    }
}
