//
//  ViewController.swift
//  MyWorkplace
//
//  Created by Gayatri Nagarkar on 09/10/17.
//  Copyright © 2017 JCI. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func viewWillAppear(_ animated: Bool) {
    
        super.viewWillAppear(true)
        UIApplication.shared.statusBarStyle = .default
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        if isValidate() {
            
            let storyboard = UIStoryboard(name: Constants.kStoryboard_Base, bundle: nil)
            
            // instantiate your desired ViewController
            let rootViewController =
                storyboard.instantiateViewController(withIdentifier: Constants.kViewController_Base)
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            if let window = appDelegate.window {
                window.rootViewController = rootViewController
            }
        }
        else {
//            let alerView = UIAlertController.init(title: Bundle().displayName, message: Constants.kAlert_InvalidCredentials, preferredStyle: UIAlertControllerStyle.alert)
//            alerView.addAction(UIAlertAction(title: Constants.kAlert_OK, style: UIAlertActionStyle.default, handler: nil))
//            present(alerView, animated: true, completion: nil)
        }
    }
    
    func isValidate() -> Bool {
        
        if ((usernameTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)!) {
            
            let alerView = UIAlertController.init(title: Bundle().displayName,
                                                  message: Constants.kAlert_BlankCredentials,
                                                  preferredStyle: UIAlertControllerStyle.alert)
            alerView.addAction(UIAlertAction(title: Constants.kAlert_OK, style: UIAlertActionStyle.default, handler: nil))
            present(alerView, animated: true, completion: nil)
            return false
        }
        else {
            
            if !((usernameTextField.text?.trimmingCharacters(in: .whitespaces).isEmpty)!) &&
                !((passwordTextField.text?.trimmingCharacters(in: .whitespaces).isEmpty)!) {
                
                let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
                if passwordTest.evaluate(with: passwordTextField.text) {
                    
                    return true
                }
                else {
                    let alerView = UIAlertController.init(title:Bundle().displayName,
                                                          message: Constants.kAlert_WrongPassword,
                                                          preferredStyle: UIAlertControllerStyle.alert)
                    alerView.addAction(UIAlertAction(title: Constants.kAlert_OK, style: UIAlertActionStyle.default,
                                                     handler: nil))
                    present(alerView, animated: true, completion: nil)
                    return false
                }
            }
            else {
                let alerView = UIAlertController.init(title: Bundle().displayName,
                                                      message: Constants.kAlert_ContainsWhitespace,
                                                      preferredStyle: UIAlertControllerStyle.alert)
                alerView.addAction(UIAlertAction(title: Constants.kAlert_OK, style: UIAlertActionStyle.default, handler: nil))
                present(alerView, animated: true, completion: nil)
                return false
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        self.usernameTextField.text = "Gayatri"
        self.passwordTextField.text = "Gayatri@123"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

