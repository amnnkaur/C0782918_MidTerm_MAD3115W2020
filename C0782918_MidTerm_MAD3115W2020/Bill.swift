//
//  Bill.swift
//  C0782918_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-11.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation

class Bill
{
    var billId : String
    var billDate : String
    var billType : String
    var billAmount: String
    
    init(billId: String, billDate: String, billType: String, billAmount: String){
        self.billId = billId
        self.billDate = billDate
        self.billType = billType
        self.billAmount = billAmount
        
    }
    
    
    
}
