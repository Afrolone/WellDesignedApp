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
    
    @IBOutlet weak var subviewContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        childViewsSetup()
        titleSetup()
        segmentedControlUIsetup()
        // Do any additional setup after loading the view.
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
    
    private func segmentedControlUIsetup() {
        loginRegisterSegmentedControl.setTitleTextAttributes([
            .foregroundColor: UIColor.black,
            .font: UIFont(name: "Rubik-Medium", size: 16)!
        ], for: .selected)
        loginRegisterSegmentedControl.setTitleTextAttributes([
            .foregroundColor: UIColor.black,
            .font: UIFont(name: "Rubik-Light", size: 16)!
        ], for: .normal)
    }

    @IBAction func didTapSegment(segment: UISegmentedControl) {
        loginVC.view.isHidden = true
        registerVC.view.isHidden = true
        if segment.selectedSegmentIndex == 0 {
            loginVC.view.isHidden = false
        } else {
            registerVC.view.isHidden = false
        }
    }
    
    
}

//extension MViewController: UITextFieldDelegate {
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        self.tagBasedTextField(textField)
//        return true
//    }
//
//}



