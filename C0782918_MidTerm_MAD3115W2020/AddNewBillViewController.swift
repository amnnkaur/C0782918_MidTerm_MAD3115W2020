//
//  AddNewBillViewController.swift
//  C0782918_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-12.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class AddNewBillViewController: UIViewController,  UITextFieldDelegate {


    @IBOutlet weak var billID: UITextField!
    @IBOutlet weak var billType: UITextField!
    @IBOutlet weak var billDate: UITextField!
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var generalLabel1: UILabel!
    @IBOutlet weak var generalLabel2: UILabel!
    @IBOutlet weak var generalLabel3: UILabel!
    @IBOutlet weak var generalLabel4: UILabel!
    @IBOutlet weak var generalLabel5: UILabel!
    @IBOutlet weak var generalTextField1: UITextField!
    @IBOutlet weak var generalTextField2: UITextField!
    @IBOutlet weak var generalTextField3: UITextField!
    @IBOutlet weak var generalTextField4: UITextField!
    @IBOutlet weak var generalTextField5: UITextField!
    static var cusId = Int()
    
    let a = Singleton.getInstance()
    
     var datePicker : UIDatePicker!
       
       override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = false
           //textField_Date.delegate = self
        print(AddNewBillViewController.cusId)
       }

    @IBAction func iSegementBillType(_ sender: UISegmentedControl) {
        isegmentValues(index: sender.selectedSegmentIndex)
    }
   
       func textFieldDidBeginEditing(_ textField: UITextField) {
           self.pickUpDate(self.billDate)
       }
    private func isegmentValues(index: Int){
        switch index{
        case 0:
            self.billType.text = "Mobile"
            self.generalLabel1.isHidden = false
            self.generalTextField1.isHidden = false
            self.generalLabel2.isHidden = false
            self.generalTextField2.isHidden = false
            self.generalLabel3.isHidden = false
            self.generalTextField3.isHidden = false
            self.generalLabel4.isHidden = false
            self.generalTextField4.isHidden = false
            self.generalLabel5.isHidden = false
            self.generalTextField5.isHidden = false
            self.generalLabel1.text = "Manufacturer Name:"
            self.generalLabel2.text = "Plan Name:"
            self.generalLabel3.text = "Mobile Number:"
            self.generalLabel4.text = "Internet Gb:"
            self.generalLabel5.text = "Minutes"
            
        case 1:
            self.billType.text = "Internet"
            self.generalLabel1.text = "Provider Name:"
            self.generalLabel2.text = "Internet GB:"
            self.generalLabel3.isHidden = true
            self.generalTextField3.isHidden = true
            self.generalLabel4.isHidden = true
            self.generalTextField4.isHidden = true
            self.generalLabel5.isHidden = true
            self.generalTextField5.isHidden = true
        case 2:
            self.billType.text = "Hydro"
            self.generalLabel1.text = "Agency Name:"
            self.generalLabel2.text = "Units Consumed:"
            self.generalLabel3.isHidden = true
            self.generalTextField3.isHidden = true
            self.generalLabel4.isHidden = true
            self.generalTextField4.isHidden = true
            self.generalLabel5.isHidden = true
            self.generalTextField5.isHidden = true
        default:
            self.billType.text = ""
        }
    }
       
       //MARK:- Function of datePicker
       func pickUpDate(_ textField : UITextField){
           
           // DatePicker
           self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
           self.datePicker.backgroundColor = UIColor.white
           self.datePicker.datePickerMode = UIDatePicker.Mode.date
           textField.inputView = self.datePicker
           
           // ToolBar
           let toolBar = UIToolbar()
           toolBar.barStyle = .default
           toolBar.isTranslucent = true
           toolBar.tintColor = .red//UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
           toolBar.sizeToFit()
           
           // Adding Button ToolBar
           let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(AddNewBillViewController.doneClick))
           let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
           let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(AddNewBillViewController.cancelClick))
           toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
           toolBar.isUserInteractionEnabled = true
           textField.inputAccessoryView = toolBar
           
       }
       
       // MARK:- Button Done and Cancel
       @objc func doneClick() {
           let dateFormatter1 = DateFormatter()
           dateFormatter1.dateStyle = .medium
           dateFormatter1.timeStyle = .none
           billDate.text = dateFormatter1.string(from: datePicker.date)
           billDate.resignFirstResponder()
       }
       
       @objc func cancelClick() {
           billDate.resignFirstResponder()
       }

    
    @IBAction func barBtnSaveBill(_ sender: UIBarButtonItem) {
        
        let billId = self.billID.text
        let date = self.billDate.text
        let billType = self.billType.text
        let billAmount = self.billAmount.text
        DataStorage.getInstance().addBill(bill: Bill.init(cusId: AddNewBillViewController.cusId, billId: billId ?? "", billDate: date ?? "", billType: billType ?? "", billAmount: billAmount ?? ""))
        let sb = UIStoryboard(name: "Main", bundle: nil)
          let billListVC = sb.instantiateViewController(identifier: "ShowBillDetailsVC") as! ShowBillDetailsViewController
        
        self.navigationController?.pushViewController(billListVC, animated: true)
        
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
