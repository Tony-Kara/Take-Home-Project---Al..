//
//  ViewController.swift
//  Take Home Project - Al..
//
//  Created by mac on 8/4/21.
//

import UIKit

class ViewController: UIViewController {

    var childData : [ChildInfo] = [
        ChildInfo(childName: "tony", childAge: 5),
        ChildInfo(childName: "tom", childAge: 10)
    
    ]
    
    
    @IBOutlet weak var tableview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        
        // register tableview
        tableview.register(UINib(nibName: "childDataCell", bundle: nil), forCellReuseIdentifier: "tony")
    }


    
    
    
}


extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return childData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "tony", for: indexPath) as! childDataCell
        cell.childName.text = childData[indexPath.row].childName
        return cell
        
        
        
        
    }
    
    
    
    
}


extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    
}
