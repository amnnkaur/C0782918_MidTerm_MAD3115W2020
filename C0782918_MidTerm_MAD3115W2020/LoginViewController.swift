//
//  ViewController.swift
//  C0782918_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-05.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var swRememberMe: UISwitch!
    
    override func viewDidLoad() {
           super.viewDidLoad()
          //  readPlistData()
           // Do any additional setup after loading the view.
       }

    
    @IBAction func barBtnSignIn(_ sender: UIBarButtonItem)
    {
        if let bundlePath = Bundle.main.path(forResource: "UserInfo", ofType: "plist")
           {
             if let dictionary = NSMutableDictionary(contentsOfFile: bundlePath)
             {
                 
                 if let customers = dictionary["Customers"] as? [[String:String]]{
                    // var flag = false
                     for user in customers
                        {
                        if user["email"] == txtEmail.text && user["password"] == txtPassword.text{
                             //flag = true
                            let sb = UIStoryboard(name: "Main", bundle: nil)
                            let secondVC = sb.instantiateViewController(identifier: "secondVC") as! CustomerListTableViewController
                            
                               self.navigationController?.pushViewController(secondVC, animated: true)
                            
                         }
                        else
                               {
                                       let alertController = UIAlertController(title: "Login Failed", message:"Invalid Email or Password", preferredStyle: .alert)
                                       
                                       alertController.addAction(UIAlertAction(title: "Try Again", style: .cancel))
                                       
                                       self.present(alertController, animated: true, completion: nil)
                               }
                         }
                     
//                     if flag == true{
//                         print("Valid user")
//
//                     }
//                     else{
//                         print("Invalid user")
//                     }
                 }
                 
            }
                
//                    if(swRememberMe.isOn)
//                    {
//                        UserDefaults.standard.set(txtEmail.text, forKey: "email")
//
//                        UserDefaults.standard.set(txtPassword.text, forKey: "password")
//                    }
//                    else
//                    {
//                        UserDefaults.standard.removeObject(forKey: "email")
//
//                        UserDefaults.standard.removeObject(forKey: "password")
//                    }
//

       


    }
    
    
}

}
