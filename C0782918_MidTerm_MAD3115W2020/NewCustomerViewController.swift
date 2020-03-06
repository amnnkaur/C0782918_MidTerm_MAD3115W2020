//
//  NewCustomerViewController.swift
//  C0782918_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-05.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class NewCustomerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addSaveButton()

    }
    
     func btnClick() {
       
        self.performSegue(withIdentifier: "thirdSegue", sender: self)
    }
    

    private func addSaveButton()
    {
        
        let btnAdd = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(save))
        
        self.navigationItem.rightBarButtonItem = btnAdd
    }
    
    @objc func save()
    {
        
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
