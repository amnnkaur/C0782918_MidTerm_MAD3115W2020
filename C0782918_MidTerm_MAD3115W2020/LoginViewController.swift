//
// ViewController.swift
// C0782918_MidTerm_MAD3115W2020
//
// Created by MacStudent on 2020-03-05.
// Copyright © 2020 MacStudent. All rights reserved.
//
import UIKit

class LoginViewController: UIViewController {
  @IBOutlet weak var txtEmail: UITextField!
  @IBOutlet weak var txtPassword: UITextField!
  @IBOutlet weak var swRememberMe: UISwitch!
   
  override func viewDidLoad() {
      super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
      // Do any additional setup after loading the view.
    }
   
  @IBAction func barBtnSignIn(_ sender: UIBarButtonItem)
  {
     if let bundlePath = Bundle.main.path(forResource: "Users", ofType: "plist")
     {
        if let dictionary = NSMutableDictionary(contentsOfFile: bundlePath)
        {
            if let customers = dictionary["Customers"] as? [[String:String]]
            {
               // print(customers)
                for user in customers{
            
                    if user["email"] == txtEmail.text && user["password"] == txtPassword.text
                    {
                        let sb = UIStoryboard(name: "Main", bundle: nil)
                        
                        let secondVC = sb.instantiateViewController(identifier: "customerListVC") as! CustomerListTableViewController
                      
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
            }
    
        }
    }
}
