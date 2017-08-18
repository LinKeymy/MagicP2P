//
//  LoginViewController.swift
//  FacebookLogin
//
//  Created by Michael Ellison on 7/5/14.
//  Copyright (c) 2014 MichaelWEllison. All rights reserved.
//

import UIKit
import MessageUI
import RxSwift
import Moya

class LoginViewController: UIViewController, UITextFieldDelegate {
    private let disposeBag = DisposeBag()
    // MARK: Properties
    private let userVM = UserVM()
    @IBOutlet var loginContentView: UIView?
    @IBOutlet var emailTextField: UITextField?
    @IBOutlet var passwordTextField: UITextField?
    @IBOutlet var logInButton: UIButton?
    @IBOutlet var signUpButton: UIButton?
    @IBOutlet var textFieldView: UIView?
    @IBOutlet var loadingView: UIActivityIndicatorView?
    @IBOutlet weak var forgotBtn: UIButton!
    @IBOutlet weak var loginContentViewCenterY: NSLayoutConstraint!
    
    @IBOutlet weak var logowidth: NSLayoutConstraint!
    
    @IBOutlet weak var forgotBtnBottomToViewBottomSpace: NSLayoutConstraint!
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addObserverForKeybord()
        configureLoginInButton()
        configureTextFieldView()
        configureEmailTextField()
        configurePasswordTextField()
    }
    // MARK: - 用户点击登录按钮调用此方法
    func userEmailAndPasswordCheck() {
        if let name = emailTextField!.text,
            let password = passwordTextField!.text {
            userVM.signIn(name: name, passwd: password).subscribeDefault(onNext: { [weak self] in
                                $0.saveAccount()
                                self?.dismiss(animated: true, completion: nil)
                                }).addDisposableTo(disposeBag)
        }
    }
    
    @IBAction func textfieldChanged(_ sender: UITextField) {
        print("TextFieldChanged")
        if emailTextField?.text?.characters.count != 0 && passwordTextField?.text?.characters.count != 0 {
            logInButton?.isEnabled = true
        } else {
            logInButton?.isEnabled = false
        }
    }
 
    // MARK: Configuration
    func configureTextFieldView() {
        textFieldView!.layer.cornerRadius = 3
    }
    
    func configureLoginInButton() {
        logInButton!.layer.cornerRadius = 3
        
    }

    
    private func postSwiftNotification(){
        dismiss(animated: true, completion: nil)
        NotificationCenter.default.post(name: NSNotification.Name(TZJUserSignInSuccess), object: nil);
    }
    
    private func addObserverForKeybord(){
        NotificationCenter.default.addObserver(self, selector: #selector(keybordChanged), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    
    }
    
    func configureEmailTextField() {
        emailTextField?.text = "13168705790"
        emailTextField!.delegate = self
    }
    
    func configurePasswordTextField() {
        passwordTextField?.text = "617982anht"
        passwordTextField!.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Text Field Should Return")
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func endEditing(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        loadingView!.startAnimating()
        logInButton!.isSelected = true
        view.endEditing(true)
        self.userEmailAndPasswordCheck()
        delay(3.0) {
            self.loadingView!.stopAnimating()
            self.logInButton!.isSelected = false
        }
    }
    
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LogIn" {
    }
    }
    
    @objc func keybordChanged(note: Notification) {
        let SCREENH = UIScreen.main.bounds.height
        let rect = (note.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let curve = (note.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).intValue
        let duration = (note.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        print(note)
        
        let offset = -(-SCREENH + rect.origin.y) + 20
        var centerOff = ((offset + 30 * 2 + 8 + 88 - SCREENH * 0.5) + 40) * (SCREENH / 667)
        let scaleFocter = centerOff > 0 ? 0.9 : 1
        centerOff = centerOff > 0 ? centerOff : 0
        loginContentViewCenterY.constant = -centerOff
        forgotBtnBottomToViewBottomSpace.constant = offset
        
        logowidth.constant = 210 * CGFloat(scaleFocter) * (SCREENH / 667)
        UIView.animate(withDuration: duration) {
            UIView.setAnimationCurve(UIViewAnimationCurve(rawValue: curve)!)
            self.view.layoutIfNeeded()
        }  
    }
}
// MARK: - 延时执行
func delay(_ delay:Double, closure:@escaping ()->()) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay, execute: closure)

}

