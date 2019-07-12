//
//  loginVC.swift
//  crecreProject
//
//  Created by 하준혁 on 12/07/2019.
//  Copyright © 2019 하준혁. All rights reserved.
//

import UIKit

class loginVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var idTextfield: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var lightMagenta: UIColor {
        return UIColor(red: 1.0, green: 87.0 / 255.0, blue: 247.0 / 255.0, alpha: 1.0)
    }
    
    var newColor = UIColor.lightMagenta.cgColor

    override func viewDidLoad() {
        super.viewDidLoad()
        
        idTextField.delegate = self
        passwordTextField.delegate = self
        loginBtn.layer.borderWidth = 0.4
        loginBtn.layer.borderColor = newColor
        
        // Do any additional setup after loading the view.
    }
//    @IBAction func loginBtnAction(_ sender: Any) {
//        guard let id = idTextField.text else {return}
//        guard let pw = pwTextField.text else {return}
//
//
//        AuthService.shared.login(id, pw) {
//            data in
//
//            switch data {
//            case .success(let token):
//                UserDefaults.standard.set(token, forKey: "token")
//
//                let dvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainNC") as! UINavigationController
//
//                self.present(dvc, animated: true)
//
//                break
//            case .requestErr(let err):
//                self.simpleAlert(title: "로그인 실패", message: err as! String)
//                break
//            case .pathErr:
//                // 대체로 경로를 잘못 쓴 경우입니다.
//                // 오타를 확인해보세요.
//                print("경로 에러")
//                break
//            case .serverErr:
//                // 서버의 문제인 경우입니다.
//                // 여기에서 동작할 행동을 정의해주시면 됩니다.
//                print("서버 에러")
//                break
//            case .networkFail:
//                self.simpleAlert(title: "통신 실패", message: "네트워크 상태를 확인하세요.")
//                break
//            }
//        }
//    }
    
    
    
    
}
