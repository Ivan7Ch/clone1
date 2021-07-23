//
//  SetupViewController.swift
//  Diia
//
//  Created by Ivan Chernetskyi on 23.07.2021.
//

import UIKit

class SetupViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var bdayTextField: UITextField!
    
    var name: String = ""
    var lastName: String = ""
    var surname: String = ""
    var bday: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name = UserDefaults.standard.string(forKey: "name") ?? "Іван"
        lastName = UserDefaults.standard.string(forKey: "lastName") ?? "Іванович"
        surname = UserDefaults.standard.string(forKey: "surname") ?? "Іваненко"
        bday = UserDefaults.standard.string(forKey: "bday") ?? "07.08.2021"
        
        nameTextField.text = name
        lastNameTextField.text = lastName
        surnameTextField.text = surname
        bdayTextField.text = bday
        
        nameTextField.addTarget(self, action: #selector(self.nameTextFieldAction(sender:)), for: .editingChanged)
        lastNameTextField.addTarget(self, action: #selector(self.lastNameTextFieldAction(sender:)), for: .editingChanged)
        surnameTextField.addTarget(self, action: #selector(self.surnameTextFieldAction(sender:)), for: .editingChanged)
        bdayTextField.addTarget(self, action: #selector(self.bdayTextFieldAction(sender:)), for: .editingChanged)
    }
    
    @IBAction func saveButtonAction() {
        UserDefaults.standard.set(name, forKey: "name")
        UserDefaults.standard.set(lastName, forKey: "lastName")
        UserDefaults.standard.set(surname, forKey: "surname")
        UserDefaults.standard.set(bday, forKey: "bday")
        NotificationCenter.default.post(name: Notification.Name("reloadViews"), object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nameTextFieldAction(sender: UITextField) {
        name = sender.text ?? ""
    }
    
    @IBAction func lastNameTextFieldAction(sender: UITextField) {
        lastName = sender.text ?? ""
    }
    
    @IBAction func surnameTextFieldAction(sender: UITextField) {
        surname = sender.text ?? ""
    }
    
    @IBAction func bdayTextFieldAction(sender: UITextField) {
        bday = sender.text ?? ""
    }
}
