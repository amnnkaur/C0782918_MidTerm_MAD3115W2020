//
//  ShowBillDetailsViewController.swift
//  C0782918_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-10.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class ShowBillDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    static var email = String()
    static var firstName = String()
    static var lastName = String()
    var tempDic:Dictionary<Int,Bill> = [:]
  
    @IBOutlet weak var customerFirstName: UILabel!
    @IBOutlet weak var customerLastName: UILabel!
    
    @IBOutlet weak var customerEmail: UILabel!
    @IBOutlet weak var tblBills: UITableView!
    
    var sinObj = Singleton.getInstance()
    
    var cust : Customer?=nil
    
        override func viewDidLoad() {
            customerFirstName.text = ShowBillDetailsViewController.email
             customerLastName.text = ShowBillDetailsViewController.firstName
             customerEmail.text = ShowBillDetailsViewController.lastName
           if cust != nil
            {

               // customerID.text = c?.customerId
                customerFirstName.text = cust?.firstName
                customerEmail.text = cust?.emailId
                
                
                tblBills.delegate = self
                tblBills.dataSource = self
            }
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let t1 = sinObj.returnCustObject(custID: Int(indexPath.row+1))
        
        let tblCell = tableView.dequeueReusableCell(withIdentifier: "billCell", for: indexPath)
        
        tblCell.textLabel?.text = t1?.firstName
        return tblCell
    }
   
}
