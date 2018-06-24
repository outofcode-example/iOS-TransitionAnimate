//
//  PresentViewController.swift
//  TransitionAnimateTest
//
//  Created by DH on 2018. 6. 24..
//  Copyright © 2018년 dh. All rights reserved.
//

import UIKit

class PresentViewController: UIViewController {

    @IBOutlet private weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closeButton.layer.cornerRadius = closeButton.frame.size.width / 2
    }

    @IBAction func didClickClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
