//
//  ViewController.swift
//  ExtremellyWellDesigned
//
//  Created by Ant Colony on 8. 12. 2021..
//

import UIKit

class MainViewController: UIViewController {
    
    let loginVC = LoginViewController()
    let registerVC = RegisterViewController()

    @IBOutlet weak var loginRegisterSegmentedControl: UISegmentedControl!
    @IBOutlet weak var controlContainer: UIView!
    @IBOutlet weak var subviewContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        childViewsSetup()
        titleSetup()
        Utils.segmentedControlSetup(
            segmentedControl: loginRegisterSegmentedControl,
            container: controlContainer
        )
    }
    
    private func childViewsSetup() {
        addChild(loginVC)
        addChild(registerVC)
        
        loginVC.didMove(toParent: self)
        registerVC.didMove(toParent: self)
        
        subviewContainer.addSubview(loginVC.view)
        subviewContainer.addSubview(registerVC.view)
        
        loginVC.view.frame = subviewContainer.bounds
        registerVC.view.frame = subviewContainer.bounds
        registerVC.view.isHidden = true
        
    }
    
    private func titleSetup() {
        self.title = "WELCOME!"
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont(name: "Rubik-Regular", size: 14)!
        ]
    }

    @IBAction func didTapSegment(segment: UISegmentedControl) {
        loginVC.view.isHidden = true
        registerVC.view.isHidden = true
        if segment.selectedSegmentIndex == 0 {
            loginVC.setTextFieldsToDefault()
            loginVC.view.isHidden = false
        } else {
            registerVC.setTextFieldsToDefault()
            registerVC.view.isHidden = false
        }
    }
}
