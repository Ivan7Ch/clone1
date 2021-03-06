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
        
        name = Person.current.name
        lastName = Person.current.lastName
        surname = Person.current.surname
        bday =  Person.current.bday
        
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
        Person.current = Person(name: name, lastName: lastName, surname: surname, bday: bday)
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
