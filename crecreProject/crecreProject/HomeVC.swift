//
//  HomeVC.swift
//  crecreProject
//
//  Created by 황채연 on 03/07/2019.
//  Copyright © 2019 하준혁. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var SearchTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuresTextFields()
        configureTapGestures()

        
        
    }
    
    private func configureTapGestures(){
        _ = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        
    }
    @objc func handleTap(){
        print("handleTap was called.")
        view.endEditing(true)
    }
    private func configuresTextFields(){
        SearchTextField.delegate = self
    }
    
    


}
extension UIViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
