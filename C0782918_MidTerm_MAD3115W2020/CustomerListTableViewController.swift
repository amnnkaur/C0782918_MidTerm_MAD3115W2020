//
//  CustomerListTableViewController.swift
//  C0782918_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-05.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class CustomerListTableViewController: UIViewController {

    var customerArray = NewCustomerViewController.getInstance().loadCustomer()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.hidesBackButton = true
        
        addLogoutButton()
        addNewCustomerButton()
        
    }
    
    private func addLogoutButton()
    {
      
        let btnLogout = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(self.logout))
        
        self.navigationItem.leftBarButtonItem = btnLogout
    }
    
    @objc func logout()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    private func addNewCustomerButton()
    {
         // let action = UIImage(systemName: "square.and.arrow.down")
        let btnAdd = UIBarButtonItem(image: UIImage(systemName: "plus") , style: .plain, target: self, action: #selector(self.add))
        self.navigationItem.rightBarButtonItem = btnAdd
    }
    
    @objc func add()
    {
        let sb = UIStoryboard(name: "Main", bundle: nil)
          let thirdVC = sb.instantiateViewController(identifier: "thirdVC") as! NewCustomerViewController
        
             self.navigationController?.pushViewController(thirdVC, animated: true)
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
extension CustomerListTableViewController: UITableViewDataSource, UITableViewDelegate{
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "customerCell")
    let customer = customerArray[indexPath.row]
     
    cell?.textLabel?.text = customerArray.first?.firstName
    cell?.detailTextLabel?.text = customerArray.first?.lastName
    //cell?.imageView?.image = 
    return cell!
}


 
}
