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
    
    override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
       }

    
    @IBAction func barBtnSignIn(_ sender: UIBarButtonItem)
    {
        UserDefaults.standard.set(txtEmail.text, forKey: "Email")
        UserDefaults.standard.set(txtPassword.text, forKey: "Password")
        
        if txtEmail.text == "amankaur@gmail.com" && txtPassword.text == "aman"
               {
               let sb = UIStoryboard(name: "Main", bundle: nil)
                   let secondVC = sb.instantiateViewController(identifier: "secondVC") as! CustomerListTableViewController
                   
                      self.navigationController?.pushViewController(secondVC, animated: true)
               }
               else
               {
                   
               }
               
           }


    }
    

