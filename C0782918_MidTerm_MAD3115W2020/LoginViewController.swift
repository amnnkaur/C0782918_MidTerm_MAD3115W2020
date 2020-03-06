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
           // Do any additional setup after loading the view.
       }

    
    @IBAction func barBtnSignIn(_ sender: UIBarButtonItem)
    {
        
        if txtEmail.text == "aman" && txtPassword.text == "aman"
               {
               let sb = UIStoryboard(name: "Main", bundle: nil)
                   let secondVC = sb.instantiateViewController(identifier: "secondVC") as! CustomerListTableViewController
                   
                      self.navigationController?.pushViewController(secondVC, animated: true)
                
                if(swRememberMe.isOn)
                    {
                        UserDefaults.standard.set(txtEmail.text, forKey: "email")
                    
                        UserDefaults.standard.set(txtPassword.text, forKey: "password")
                    }
                    else
                    {
                        UserDefaults.standard.removeObject(forKey: "email")
                        
                        UserDefaults.standard.removeObject(forKey: "password")
                    }
                }
        
               
    
        else
        {
                let alertController = UIAlertController(title: "Login Failed", message:"Incorrect Email or Password", preferredStyle: .alert)
                
                alertController.addAction(UIAlertAction(title: "Try Again", style: .cancel))
                
                self.present(alertController, animated: true, completion: nil)
        }


    }
    
}
