//
//  signUpVC.swift
//  crecreProject
//
//  Created by 하준혁 on 13/07/2019.
//  Copyright © 2019 하준혁. All rights reserved.
//

import UIKit

class signUpVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var segueGender: UISegmentedControl!
    
    
    @IBOutlet weak var IdTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var rePasswordTextField: UITextField!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthTextField: UITextField!
    
    var selectedGender: String?

    
    var lightMagenta: UIColor {
        return UIColor(red: 1.0, green: 87.0 / 255.0, blue: 247.0 / 255.0, alpha: 1.0)
    }
    
    var newColor = UIColor.lightMagenta.cgColor


    
    override func viewDidLoad() {
        super.viewDidLoad()
        IdTextField.setBottomBorder()
        passwordTextField.setBottomBorder()
        rePasswordTextField.setBottomBorder()
        nickNameTextField.setBottomBorder()
        nameTextField.setBottomBorder()
        birthTextField.setBottomBorder()
        
        segueGender.selectedSegmentIndex = 0
        
        signUpBtn.layer.borderWidth = 0.5
        signUpBtn.layer.cornerRadius = 10
        signUpBtn.layer.borderColor = newColor
        checkBtn.layer.borderWidth = 0.5
        checkBtn.layer.borderColor = newColor
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func selectedAction(_ sender: Any) {
        switch segueGender.selectedSegmentIndex {
        case 0:
            selectedGender = "M"
        case 1:
            selectedGender = "F"
        default:
            ()
        }
    }
    

}

extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 0.0
    }
}
