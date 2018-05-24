//
//  RegisterPageViewController.swift
//  CafeListView
//
//  Created by SWUCOMPUTER on 2018. 5. 13..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {

    @IBOutlet var userEmailTextField: UITextField!
    @IBOutlet var userPasswordTextField: UITextField!
    @IBOutlet var repeatPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func registerButtonTapped(sender: Any) {
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextField.text
        let userRepeatPassword = repeatPasswordTextField.text
        
        // Check for empty fields
        if((userEmail?.isEmpty)! || (userPassword?.isEmpty)! || (userRepeatPassword?.isEmpty)!)
        {
            //Display alert message
            
            displayMyAlertMessage(userMessage: "All fields are required");
            
            return
        }
        
        //Check if passwords match
        if(userPassword != userRepeatPassword)
        {
            // Display an alert message
            displayMyAlertMessage(userMessage: "Passwords do not match");
            return
        }
        

        // Store data
        UserDefaults.standard.set(userEmail, forKey:"UserEmail")
        UserDefaults.standard.set(userPassword, forKey:"UserPassword")
        UserDefaults.standard.synchronize()
        
        // Display alert message with confirmation
        var myAlert = UIAlertController(title : "Alert", message:"Registration is successful. Tahnk you!", preferredStyle : UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title:"OK", style: UIAlertActionStyle.default)
        {
            action in
            self.dismiss(animated: true, completion:nil)
        }
        myAlert.addAction(okAction)
        self.present(myAlert, animated:true, completion:nil)
    }
    
    
    func displayMyAlertMessage(userMessage:String)
    {
        var myAlert = UIAlertController(title : "Alert", message:userMessage, preferredStyle : UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title:"OK", style: UIAlertActionStyle.default, handler:nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }
    
   

}
