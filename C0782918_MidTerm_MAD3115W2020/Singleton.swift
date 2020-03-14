//
//  Singleton.swift
//  C0782918_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-07.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation

class Singleton: NSObject
{
     private var customerDictionary  = [Int:Customer]()
    var billDictionary = [Int:Bill]()
    private static var obj = Singleton()
    
    
    private override init() {
        
    }
    
    internal static func getInstance() -> Singleton
    {
        return obj
    }
    
    func addNewCustomer(First_Name : String, Last_Name : String, email : String)
    {
        let c = customerDictionary.count + 1
        
        let temp = Customer(customerId: c, firstName: First_Name, lastName: Last_Name, emailId: email)
        self.AddCustomer(customer: temp)
    }
    
    func returnCustObject(custID : Int) -> Customer?
    {
        for (k,v) in customerDictionary
        {
            if custID == k
            {
                return v
            }
        }
        return nil
        
    }
    
    func returnCount() -> Int
    {
        return customerDictionary.count
    }
    
    func createCust()
    {
        
    let c1 = Customer(customerId: 1, firstName: "Aman", lastName: "Kaur", emailId: "aman@gmail.com")
        AddCustomer(customer: c1)
        
    let c2 = Customer(customerId: 2, firstName: "Anmol", lastName: "Singh", emailId: "anmol@gmail.com")
    AddCustomer(customer: c2)
        
    let c3 = Customer(customerId: 3, firstName: "Monika", lastName: "Sharma", emailId: "monika@gmail.com")
    AddCustomer(customer: c3)
        
    let c4 = Customer(customerId: 4, firstName: "Ikroop", lastName: "Virk", emailId: "ikroop@gmail.com")
    AddCustomer(customer: c4)
        
    let c5 = Customer(customerId: 5, firstName: "Kritima", lastName: "Kukreja", emailId: "kritima@gmail.com")
    AddCustomer(customer: c5)
        
    }
    
    

    
    func AddCustomer(customer: Customer)
    {
        customerDictionary.updateValue(customer, forKey: customer.customerId)
        print(customerDictionary)
        
    }
    
    func addBillToCustomer(bill:Bill)
      {
             billDictionary.updateValue(bill, forKey: bill.billId)
      }
    
    func printdata()
    {
        for i in customerDictionary.values
        {
            print(i.firstName)
        }
    }
    

}
