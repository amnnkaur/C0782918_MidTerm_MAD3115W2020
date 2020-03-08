//
// CustomerListTableViewController.swift
// C0782918_MidTerm_MAD3115W2020
//
// Created by MacStudent on 2020-03-05.
// Copyright © 2020 MacStudent. All rights reserved.
//
import UIKit
class CustomerListTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  @IBOutlet weak var tblCustomer: UITableView!
  var firstName: String!
   var lastName: String!
   var email: String!
var tempvar = Singleton.getInstance()
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.hidesBackButton = true
     let getdata = Singleton.getInstance()
        getdata.createCust()
    addLogoutButton()
    addNewCustomerButton()
    //DataStorage.getInstance().loadData()
   // customerArray = DataStorage.getInstance().getAllCustomers()
     
     
  }
   
  private func addLogoutButton()
  {
    
    let btnLogout = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(self.logout))
     
    self.navigationItem.leftBarButtonItem = btnLogout
  }
   
  @objc func logout()
  {
    //let sb = UIStoryboard(name: "Main", bundle: nil)
    //let loginVC = sb.instantiateViewController(identifier: "loginVC") as! LoginViewController
   // self.navigationController?.pushViewController(loginVC, animated: true)
    self.navigationController?.popToRootViewController(animated: true)
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

//extension CustomerListTableViewController: UITableViewDataSource, UITableViewDelegate{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tempvar.returnCount()
  }
   
  func tableView(in tableview: UITableView) -> Int {
    return 1
  }
   
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let x = tempvar.returnCustObject(custID: Int(indexPath.row+1))
    let cell = tableView.dequeueReusableCell(withIdentifier: "customerCell",for: indexPath)
      // let customer = customerArray[indexPath.row]
    cell.textLabel?.text = x?.firstName
           return cell
 //   cell?.textLabel?.text = firstName
  //  cell?.detailTextLabel?.text = lastName
    //cell?.imageView?.image = country.flag
    //   return cell!
  }
   
      func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
          return "List of Customers"
      }
      
      override func viewWillAppear(_ animated: Bool) {
             tblCustomer.reloadData()
             
         }


}




