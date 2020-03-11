//
//  Bill.swift
//  C0782918_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-11.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation

class Bill: IDisplay {

func display() {
        
}
    
    var billId : Int
    var billDate : String
    //var amount : Float
    enum bTypes: String {
        case Internet
        case Mobile
        case Hydro
    }
    var billType : bTypes
    
    init(billId : Int , billDate : String, billType : bTypes) {
        self.billId = billId
        self.billDate = billDate
        self.billType = billType
    }
    
    
}
