//
//  LoginViewController.swift
//  gestta
//
//  Created by Carlos Henrique on 20/06/17.
//  Copyright © 2017 redspark. All rights reserved.
//

import UIKit
import RSWidgets
import RSStarterKit
import SVProgressHUD
import ScrollPager

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userName: RSTextField!
    @IBOutlet weak var userPassword: RSTextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userPasswordLabel: UILabel!
    
    @IBOutlet weak var loginButton: RSButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollPager: ScrollPager!
    
    fileprivate var loginManager = LoginManager()
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCloseKeyboardWhenTapView(on: contentView)
        setupScrollViewConstraints()
        applyLanguage()
        applyStyle()
        setupInputValidators()
        
        userName.text = "carlos.prod@redspark.io"
        userPassword.text = "123456aS"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        removeKeyboardNotifications()
        forceKeyboardClose()
    }
    
    // MARK: - Memory Warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private Methods
    fileprivate func applyLanguage () {
        // Apply all localized strings
        
        userNameLabel.text = StringIdentifier.userNameLabel.getString()
    }
    
    fileprivate func applyStyle () {
        // Apply color scheme and visual effects
        Style.apply(onPrimaryButton: loginButton)
        
    }
    
    fileprivate func setupInputValidators(){
        userName.setEmailValidator()
    }
    
    
    // MARK: - Keyboard Stuffs
    func setupKeyboardNotifications() {
        let defaultCenter = NotificationCenter.default
        defaultCenter.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        defaultCenter.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func removeKeyboardNotifications() {
        let defaultCenter = NotificationCenter.default
        defaultCenter.removeObserver(self)
    }
    
    func keyboardWillShow(notification: Notification) {
        // Change scrollview to tableview / collectionview if needed
        keyboardWillShow(notification, scrollView: scrollView, scrollToView: nil)
    }
    
    func keyboardWillHide(notification: Notification) {
        // Change scrollview to tableview / collectionview if needed
        keyboardWillHide(notification, scrollView: scrollView)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
    */
//     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
//        switch segueIdentifierForSegue(segue) {
//        case .mainViewController:
//            let mainViewController = segue.destination as! UITableViewController
//        default:
//        }
//        
//     }
 
    
     // MARK: - Actions
    @IBAction func performLogin() {
        forceKeyboardClose()
        if RSTextField.isValid([userName, userPassword]){
            SVProgressHUD.show()
            guard let user = userName.text, let password = userPassword.text else { return }
            
            loginManager.performLogin(email: user, password: password, success: onLoginSuccess, failure: onLoginError)
            
        } else {
            let alertController = UIAlertController(title: "ERROR", message: "Preencha os campos", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
            
        }
    }
    
}


// MARK - Login Callback
extension LoginViewController {
    fileprivate func onLoginSuccess(user: User) {
        SVProgressHUD.dismiss()
        print("user: \(user.name)")
    
        performSegueWithIdentifier(.mainViewController, sender: self)
    }
    
    fileprivate func onLoginError(error: RSError) {
        SVProgressHUD.dismiss()
        print("ERROOOOOOOR")
    }
}

//MARK:  - TextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    // Implement textfield delegate to jump to another view with next tag value
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextView = textField.focusNextViewByTag(insideView: view){
            scrollView.scrollToView(nextView)
        }
        
        return false
    }
}


/*
//MARK:  - SegueHandlerType
*/
extension LoginViewController: SegueHandlerType {
    
    enum SegueIdentifier: String {
        case mainViewController
    }
 
}


//MARK:  - KeyboardProtocol
extension LoginViewController : RSKeyboardHandlerProtocol { }

//MARK: - RSScrollViewConstraintsProtocol
extension LoginViewController : RSScrollViewConstraintsProtocol { }

