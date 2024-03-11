//
//  UserModel.swift
//  Kakeibo
//
//  Created by 広瀬友哉 on 2024/03/11.
//

import Foundation
import SwiftData

@Model
final class Users {
    var uuid: String
    var id: String
    var pass: String
    var auth: String
    
    init(uuid: String, id: String, pass: String, auth: String) {
        self.uuid = uuid
        self.id = id
        self.pass = pass
        self.auth = auth
    }
}