//
//  Customer.swift
//  C0782918_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-06.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation
public class Customer
{
    var customerId : Int
    var firstName : String
    var lastName : String
    var emailId : String
   // var billDictionary = [Int:Bill]()
   // var totalBillAmount: Float = 0.0
   
    init(customerId: Int, firstName: String, lastName: String, emailId : String)
    {
        self.customerId = customerId
        self.firstName = firstName
        self.lastName = lastName
        self.emailId = emailId
        
    }
    
//    func emailValidation(email: String) -> Bool {
//        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//
//        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
//        return emailPredicate.evaluate(with: email)
//    }
//
//    func addBillToCustomer(bill:Bill)
//    {
//           billDictionary.updateValue(bill, forKey: bill.billId)
//    }
//
//    func calculateTotalBillAmount() -> Float
//    {
//        var stop: Float = 0.0
//        for i in billDictionary.values
//        {
//            totalBillAmount += i.totalBillAmount
//            stop = totalBillAmount
//        }
//        totalBillAmount = 0.0
//        return Float(stop)
//    }
//
//    func display()
//    {
//     print("\t")
//     print("~~~~~CUSTOMER INFORMATION~~~~~")
//        print("Customer ID: \(customerId.customerPrefix())")
//     print("Customer Name: \(fullName())")
//
//        if self.emailValidation(email: emailId){
//          print("Customer Email ID : \(self.emailId)")
//        }
//        else{
//         print("Customer Email ID : Email ID is not valid")
//        }
//
//
//     print("\t\t\t\t~~~~~BILL INFORMATION~~~~~")
//
//     print("\t\t******************************************")
//
//     if billDictionary.isEmpty
//     {
//         print("\t\t The Customer has no Bills to pay")
//     }
//     else
//     {
//         for b in billDictionary.values
//         {
//             b.display()
//             print("\t\t******************************************")
//         }
//     }
//         print("\t\tTotal Bill Amount to Pay: \(calculateTotalBillAmount().currencyFormat())")
//    }
}
