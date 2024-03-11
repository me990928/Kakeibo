//
//  UserViewModel.swift
//  Kakeibo
//
//  Created by 広瀬友哉 on 2024/03/09.
//

import Foundation
import SwiftData

class UserSheetViewModel: ObservableObject {
    
    @Published var model = UserSheetModel()
    
    func createUser(mc: ModelContext, completed: @escaping ()->Void){
        let newModel = Users(uuid: UUID().uuidString, id: self.model.inputId, name: self.model.inputName, pass: self.model.inputPass, auth: self.model.selectedAuthority)
        mc.insert(newModel)
        try! mc.save()
        completed()
    }
    
}
