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

   
    @IBOutlet weak var rememberSwitch: UISwitch!
    override func viewDidLoad() {
      super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
      // Do any additional setup after loading the view.
     rememberSwitch.addTarget(self, action: #selector(self.stateChanged), for: .valueChanged)
            let defaults: UserDefaults? = UserDefaults.standard

    // check if defaults already saved the details

        if (defaults?.bool(forKey: "ISRemember"))! {
                txtEmail.text = defaults?.value(forKey: "SavedUserName") as! String
                txtPassword.text = defaults?.value(forKey: "SavedPassword") as! String
                rememberSwitch.setOn(true, animated: false)
            }
            else {
                rememberSwitch.setOn(false, animated: false)
            }
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
                var flag = false
                for user in customers{
            
                    if user["email"] == txtEmail.text && user["password"] == txtPassword.text
                    {
                       
                        flag = true
                    }}
                         if flag == true{
                                           print("Valid user")
                             let sb = UIStoryboard(name: "Main", bundle: nil)
                            
                                                    let secondVC = sb.instantiateViewController(identifier: "customerListVC") as! CustomerListTableViewController
                            
                                                    self.navigationController?.pushViewController(secondVC, animated: true)
                                       }
                                       else{
                                           print("Invalid user")
                            let alertController = UIAlertController(title: "Login Failed", message:"Incorrect Email or Password", preferredStyle: .alert)

                                                   alertController.addAction(UIAlertAction(title: "Try Again", style: .cancel))

                                                   self.present(alertController, animated: true, completion: nil)
                                       }
                }
   
                }
            }
    
        }
    @objc func stateChanged(_ switchState: UISwitch) {

    let defaults: UserDefaults? = UserDefaults.standard
        if switchState.isOn {
        defaults?.set(true, forKey: "ISRemember")
        defaults?.set(txtEmail.text, forKey: "SavedUserName")
        defaults?.set(txtPassword.text, forKey: "SavedPassword")
    }
    else {
        defaults?.set(false, forKey: "ISRemember")
        }
        }
        }

