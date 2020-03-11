//
//  Hydro.swift
//  C0782918_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-11.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation

class Hydro: Bill{
   
    var agencyName : String
    var unitConsumed : Int
    var billAmount : Float
    
    init(billID : Int , billDate : String, billType : bTypes, agencyName : String, unitConsumed : Int , billAmount : Float) {
        self.agencyName = agencyName
        self.unitConsumed = unitConsumed
        self.billAmount = billAmount
        super.init(billId : billID, billDate : billDate, billType : billType)
        
    }
    
    override func display() {
        print("*****************************")
        print("       Bill Details      ")
        print("*****************************")
        print("Bill ID : \(billId)")
        print("BillDate : \(billDate)")
        print("Bill Type : \(billType)")
        print("Agency Name : \(agencyName)")
        print("Unit Consumed : \(unitConsumed)")
        print("Bill Amount : $\(billAmount)")
    }
}
