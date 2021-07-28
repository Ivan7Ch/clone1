//
//  PassportInfo.swift
//  Diia
//
//  Created by Ivan Chernetskyi on 21.07.2021.
//

import Foundation

struct PassportInfo: Codable {
    var passportTitle: String
    let bday: String
    let number: String
    let personFullName: String
    let passportPicture: String
    let signaturePicture: String
}

struct Person {
    let name: String
    let lastName: String
    let surname: String
    let bday: String
    
    var formattedFullName: String {
        return "\(name)\n\(lastName)\n\(surname)"
    }
    
    var formattedBDay: String {
        return "Дата народження:\n\(bday)"
    }
    
    static var current: Person {
        get {
            let name = UserDefaults.standard.string(forKey: "name") ?? "Іван"
            let lastName = UserDefaults.standard.string(forKey: "lastName") ?? "Іванович"
            let surname = UserDefaults.standard.string(forKey: "surname") ?? "Іваненко"
            let bday = UserDefaults.standard.string(forKey: "bday") ?? "07.08.2021"
            return Person(name: name, lastName: lastName, surname: surname, bday: bday)
        }
        
        set {
            UserDefaults.standard.set(newValue.name, forKey: "name")
            UserDefaults.standard.set(newValue.lastName, forKey: "lastName")
            UserDefaults.standard.set(newValue.surname, forKey: "surname")
            UserDefaults.standard.set(newValue.bday, forKey: "bday")
        }
    }
}
