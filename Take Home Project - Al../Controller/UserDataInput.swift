//
//  UserDataInput.swift
//  Take Home Project - Al..
//
//  Created by mac on 8/6/21.
//

import UIKit

class UserDataInput : UIViewController {
    

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userAge: UITextField!
    
    
    
    var userDataModel : UserDataModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userName.delegate = self
        userAge.delegate = self
        
    }
    
    //MARK: - Save button IBAction
    
    @IBAction func saveBtnTapped(_ sender: UIButton) {
        
        userName.endEditing(true)
        userAge.endEditing(true)
        
        self.performSegue(withIdentifier: "tony", sender: self)
        
    }
    
    //MARK: - segue function
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tony" {
            
            let destinationVC = segue.destination as! ViewController
            destinationVC.name = userDataModel?.userNameInfo
            destinationVC.age = userDataModel?.userAgeInfo
            
            
        }
    }
    
    
}

//MARK: - UITextFieldDelegate
extension UserDataInput : UITextFieldDelegate {
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { //on pressing the return button on phone, what should happen? This is what this functions asks.
        
        textField.endEditing(true)
        return true
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if textField.text != "" { // this function will keep the user and the keyboard on hold until input is entered into the textfield.
            return true
        }
        else {
            textField.placeholder = "напишите здесь"
            return false
        }
        
 
    }
    

    func textFieldDidEndEditing(_ textField: UITextField) { // This function is called after the user has finished entering inputs into the search field.
        if let nameOfUser = userName.text, let ageOfUser = userAge.text {
            userDataModel = UserDataModel(userNameInfo: nameOfUser, userAgeInfo: ageOfUser)
            
            
        }
        
        
    }
    
    
    
    
    
    
    
    
}
