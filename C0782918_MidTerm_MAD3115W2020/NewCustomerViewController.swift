
// NewCustomerViewController.swift
// C0782918_MidTerm_MAD3115W2020
//
// Created by MacStudent on 2020-03-05.
// Copyright © 2020 MacStudent. All rights reserved.
//
import UIKit
class NewCustomerViewController: UIViewController {
  @IBOutlet weak var txtFirstName: UITextField!
  @IBOutlet weak var txtLastName: UITextField!
  @IBOutlet weak var txtEmail: UITextField!
     let a = Singleton.getInstance()
  var firstName: String!
  var lastName: String!
  var email: String!
  var cust: Customer!
  override func viewDidLoad() {
    super.viewDidLoad()
     
  }
//   func btnClick() {
//    
//    self.performSegue(withIdentifier: "thirdSegue", sender: self)
//  }
  
  @IBAction func barBtnSave(_ sender: UIBarButtonItem) {
      firstName = self.txtFirstName.text
      lastName = self.txtLastName.text
      email = self.txtEmail.text
    
    let sb = UIStoryboard(name: "Main", bundle: nil)
    let customerListVC = sb.instantiateViewController(identifier: "customerListVC") as! CustomerListTableViewController
      customerListVC.firstName = firstName
      customerListVC.lastName = lastName
      customerListVC.email = email
      a.addNewCustomer(First_Name: firstName!, Last_Name: lastName!, email: email!)
  // Singleton.addNewCustomer(self.firstName,self.lastName,self.email)
    self.navigationController?.pushViewController(customerListVC, animated: true)
    
    let alert = UIAlertController(title: "Success", message: "Congrats! Added Successfully", preferredStyle: .alert)

                   alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(alert: UIAlertAction!) in self.navigationController?.popViewController(animated: true)}))
 
  }
 
    @IBAction func backToCustomers(_ sender: UIButton) {
                            
        self.navigationController?.popViewController(animated: true)
    }
    
  /*
  // MARK: - Navigation
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
  }
  */
}



