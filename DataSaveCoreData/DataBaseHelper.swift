//
//  DataBaseHelper.swift
//  DataSaveCoreData
//
//  Created by Akash Belekar on 12/04/23.
//

import Foundation
import UIKit
import CoreData

class DataBaseHelper{
    
    static let shared = DataBaseHelper()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //Data save in storage
    func save(object:[String:String]){
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as! Student
        
        student.name = object["name"]
        student.city = object["city"]
        student.address = object["address"]
        student.mobile = object["mobile"]
        
             
        do {
            try context.save()
        } catch  {
            print("Data couldn`t be Saved yet..")
        }
        
    }
    //Show data on tableView
    func getDataStudent() -> [Student]{
        
        var student = [Student]()
        
        //using NSFetchRequest to fetchdata on entity
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        
        do {
            // fetch in persistentContainer and assinged to student
             student = try context.fetch(fetchRequest) as! [Student]
        } catch  {
            print("Data not to be fetched yet.")
        }
        return student
    }
    //Delete data on tableView (row)
    
    func deleteData(index:Int) -> [Student]{
        var student = getDataStudent()
        //deleted in persistentContainer
        context.delete(student[index])
        // delete or remove in student array (entity)
        student.remove(at: index)
        
        do{
            //save data
            try context.save()
        }
        catch{
            print("Can`t deleted Data..")
        }
        return student
    }
    
    //Edit row on tableView
    
    func editData(object:[String:String], index:Int){
        var student = getDataStudent()
        student[index].name = object["name"]
        student[index].city = object["city"]
        student[index].address = object["address"]
        student[index].mobile = object["mobile"]
        
        do {
            try context.save()
        } catch  {
            print("data Not edited yet..")
        }
    }
}
