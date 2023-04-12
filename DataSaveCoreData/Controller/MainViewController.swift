//
//  MainViewController.swift
//  DataSaveCoreData
//
//  Created by Akash Belekar on 12/04/23.
//

import UIKit

class MainViewController: UIViewController,DataPass {
  
    
   
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    
    var i = Int()
    var isEditData = Bool()
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func saveDataBtn(_ sender: UIButton) {
        print("SavaBtnClicked")
        let dic = ["name":txtName.text,"city":txtCity.text,"address":txtAddress.text,"mobile":txtMobile.text]
        if isEditData{
            DataBaseHelper.shared.editData(object: dic as! [String:String], index: i)
        }
        else{
            let dic = ["name":txtName.text,"city":txtCity.text,"address":txtAddress.text,"mobile":txtMobile.text]
              DataBaseHelper.shared.save(object: dic as! [String:String])
        }
       
       
    }
    
    @IBAction func showDataBtn(_ sender: UIButton) {
        let vc = ListViewViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.delegate = self
        present(vc, animated: true)
    }
  
    
    func data(object: [String : String], index: Int, isEdited: Bool) {
        txtName.text = object["name"]
        txtCity.text = object["city"]
        txtAddress.text = object["address"]
        txtMobile.text = object["mobile"]
        i = index
        isEditData = isEdited
        
    }
    
    
    
}
