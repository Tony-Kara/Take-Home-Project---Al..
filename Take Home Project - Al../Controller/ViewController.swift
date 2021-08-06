//
//  ViewController.swift
//  Take Home Project - Al..
//
//  Created by mac on 8/4/21.
//

import UIKit

class ViewController: UIViewController {
    
    var childArray : [ChildInfo] = []
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userAge: UILabel!
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var addNewDataTapped: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userName.text = "UserName: \(name!)"
        userAge.text = "Age of User: \(age!)"
        
        tableview.dataSource = self
        

        
        // register tableview
        tableview.register(UINib(nibName: "childDataCell", bundle: nil), forCellReuseIdentifier: "tony")
    }
    
    var name : String?
    var age :  String?
    
    //MARK: - Fucntions to add Each child data
    @IBAction func addNewData(_ sender: UIBarButtonItem) {
        
        var textFieldOne = UITextField()
        var textFieldTwo = UITextField()
        
        
        let alert = UIAlertController(title: "Add child's name", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Name", style: .default) { (action) in
            // actions that will occur after pressing button
            let newData = ChildInfo(childName: "\(textFieldOne.text!)", childAge: "\(textFieldTwo.text!)")
            self.childArray.append(newData)
            if self.childArray.count >= 5 {
                self.addNewDataTapped.isEnabled = false
                self.addNewDataTapped.tintColor = UIColor.white
            }
            self.tableview.reloadData()
            
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Enter child's Name"
            textFieldOne = alertTextField
        }
        
        alert.addTextField { (alertTextFieldTwo) in
            alertTextFieldTwo.placeholder = "Enter child's Age"
            textFieldTwo = alertTextFieldTwo
        }
        
        
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
    }
    
 
    
}


//MARK: - UITableViewDataSource
extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return childArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "tony", for: indexPath) as! childDataCell
        cell.childName.text = childArray[indexPath.row].childName
        cell.childAge.text = childArray[indexPath.row].childAge
        
        // a way to indirectly create an IBAction for my deleteBtn which lies in the xib file
        cell.deleteBtn.addTarget(self, action: #selector(deleteBtnTapped(sender:)), for: .touchUpInside)
        return cell
     
    }
    
    
    @objc func deleteBtnTapped(sender: UIButton){
        // get a paticular point in tableview, in my case, the point where my present row exists
        let point = sender.convert(CGPoint.zero, to: tableview)
        guard let indexPath = tableview.indexPathForRow(at: point) else{return}
        childArray.remove(at: indexPath.row)
        tableview.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .left)
        tableview.reloadData()
        
    }
    
    
}



