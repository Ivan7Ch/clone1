//
//  PasportInfo.swift
//  Diia
//
//  Created by Ivan Chernetskyi on 21.07.2021.
//

import Foundation

struct PasportInfo: Codable {
    var passportTitle: String
    let bday: String
    let number: String
    let personFullName: String
    let passportPicture: String
    let signaturePicture: String
}
