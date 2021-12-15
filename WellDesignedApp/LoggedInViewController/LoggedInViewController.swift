//
//  LoggedInViewController.swift
//  WellDesignedApp
//
//  Created by Ant Colony on 15. 12. 2021..
//

import Foundation
import UIKit

class LoggedInViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    
    var email: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailLabel.text = email
    }
}
