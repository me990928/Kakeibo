//
//  UserSheetModel.swift
//  Kakeibo
//
//  Created by 広瀬友哉 on 2024/03/09.
//

import Foundation

struct UserSheetModel {
    var inputId: String = ""
    var inputPass: String = ""
    var inputName: String = ""
    
    var isLoading: Bool = false
    
    // ユーザ権限後で追加用(アップデートネタ)
    let authority: [String] = ["root", "Familly", "User"]
    var selectedAuthority: String = "User"
}
