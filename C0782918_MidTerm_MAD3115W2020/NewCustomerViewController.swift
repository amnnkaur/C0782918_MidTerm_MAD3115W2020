//
//  NewCustomerViewController.swift
//  C0782918_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-05.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class NewCustomerViewController: UIViewController {

    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
  //var customerIntials = ["firstName": String(), "lastName": String(), "txtEmail": String()]
    
    var customerIntials : [Customer] = []
    override func viewDidLoad() {
        super.viewDidLoad()
       // addSaveButton()
//loadCustomers()
    }
    
     func btnClick() {
       
        self.performSegue(withIdentifier: "thirdSegue", sender: self)
    }
    
    func loadCustomer() -> [Customer]{
        customerIntials.append(Customer(customerId: 0, firstName: txtFirstName.text!, lastName: txtLastName.text!, emailId: txtEmail.text!))
        return customerIntials
    }
    

    @IBAction func barBtnSave(_ sender: UIBarButtonItem) {
print(loadCustomer())
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
