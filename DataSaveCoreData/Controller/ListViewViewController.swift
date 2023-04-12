//
//  ListViewViewController.swift
//  DataSaveCoreData
//
//  Created by Akash Belekar on 12/04/23.
//

import UIKit
protocol DataPass{
    func data(object:[String:String],index:Int,isEdited:Bool)
}

class ListViewViewController: UIViewController {
    @IBOutlet weak var listTbl:UITableView!
    var studentModel = [Student]()
    var delegate:DataPass?
    override func viewDidLoad() {
        super.viewDidLoad()
        listTbl.register(UINib(nibName: "ListViewTVC", bundle: nil), forCellReuseIdentifier: "ListViewTVC")
        listTbl.dataSource = self
        listTbl.delegate = self
        studentModel = DataBaseHelper.shared.getDataStudent()
        listTbl.reloadData()
       
    }


    @IBAction func backBtn(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
extension ListViewViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListViewTVC", for: indexPath) as! ListViewTVC
        cell.student = studentModel[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            studentModel = DataBaseHelper.shared.deleteData(index: indexPath.row)
            self.listTbl.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dic = ["name":studentModel[indexPath.row].name,"city":studentModel[indexPath.row].city,"address":studentModel[indexPath.row].address,"mobile":studentModel[indexPath.row].mobile]
        delegate?.data(object: dic as! [String:String], index: indexPath.row, isEdited: true)
    }
}
