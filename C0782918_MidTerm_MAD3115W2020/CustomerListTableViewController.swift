//
//  CustomerListTableViewController.swift
//  C0782918_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-05.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class CustomerListTableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.hidesBackButton = true
        addLogoutButton()
    }
    

    private func addLogoutButton()
    {
        let btnLogout = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(self.logout))

        self.navigationItem.leftBarButtonItem = btnLogout
    }
    
    private func addNewCustomerButton()
    {
        
    }
    
    @objc func logout()
    {
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
