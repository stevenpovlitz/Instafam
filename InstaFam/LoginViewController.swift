//
//  LoginViewController.swift
//  InstaFam
//
//  Created by Steven Povlitz on 3/8/16.
//  Copyright © 2016 Steven Povlitz. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    @IBAction func onSignIn(sender: AnyObject) {
    }
    
    
    @IBAction func onSignUp(sender: AnyObject) {
        // initialize a user object
        let newUser = PFUser()
        
        // set user properties
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        
        print("newUser.username is \(newUser.username)")
        print("newUser.password is \(newUser.password)")
        
        // call sign up function on the object
        newUser.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if let error = error {
                print(error.localizedDescription)
                if error.code == 202 {
                    print("Username is taken")
                }
            } else {
                print("User Registered successfully")
            }
        }
        
    }
    

}
