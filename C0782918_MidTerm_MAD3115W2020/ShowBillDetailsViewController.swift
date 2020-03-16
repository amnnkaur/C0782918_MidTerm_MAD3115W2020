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
    static var cusId = Int()
    var tempDic:Dictionary<Int,Bill> = [:]
    lazy var billList : [Bill] = []
  
    @IBOutlet weak var customerFirstName: UILabel!
    @IBOutlet weak var customerLastName: UILabel!
    
    @IBOutlet weak var customerEmail: UILabel!
    @IBOutlet weak var tblBills: UITableView!
    
    var sinObj = Singleton.getInstance()
    
    var cust : Customer?=nil
    
    override func viewDidLoad() {
        print(ShowBillDetailsViewController.cusId)
       // self.navigationItem.hidesBackButton = true
        billList = DataStorage.getInstance().getAllBills()
        customerFirstName.text = ShowBillDetailsViewController.firstName
        customerLastName.text = ShowBillDetailsViewController.lastName
        customerEmail.text = ShowBillDetailsViewController.email
            
            
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
        return billList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let t1 = sinObj.returnCustObject(custID: Int(indexPath.row+1))
        
        let tblCell = tableView.dequeueReusableCell(withIdentifier: "billCell", for: indexPath) as! BillTableViewCell
        let bill = billList[indexPath.row]
        if bill.cusId == ShowBillDetailsViewController.cusId{
        tblCell.billID.text = "Bill ID: " + bill.billId
        tblCell.billType.text = "Bill Type: " + bill.billType
        tblCell.billDate.text = "Bill Date: " + bill.billDate
            tblCell.billAmount.text = "Bill Amount: " + bill.billAmount}
        else {
            
        }
//        tblCell.textLabel?.text = "k"
        return tblCell
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(150.0)
    }
}

