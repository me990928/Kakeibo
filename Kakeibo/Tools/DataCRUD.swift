//
//  DataCRUD.swift
//  Kakeibo
//
//  Created by 広瀬友哉 on 2024/02/27.
//

import Foundation
import SwiftData

class DataCRUD {
    
    // 小カテゴリ
    func addSmallCategoryData(mc: ModelContext, name: String){
        let newModel = SmallCategory(id: UUID().uuidString, name: name)
        mc.insert(newModel)
        try! mc.save()
    }
    
    // 大カテゴリ
    func addLargeCategoryData(mc: ModelContext, name: String){
        let newModel = LargeCategory(id: UUID().uuidString, name: name)
        mc.insert(newModel)
        try! mc.save()
    }
    
    // カテゴリ登録
    func registCategory(mc: ModelContext,id: String, largeId: String, smallIds: [String]){
        var newModels: [KakeiboLargeSmallCategory] = []
        for smallId in smallIds {
            newModels.append(KakeiboLargeSmallCategory(id: UUID().uuidString, kakeiboId: id, smallId: smallId, largeId: largeId))
        }
        
        for model in newModels {
            mc.insert(model)
        }
        try! mc.save()
    }
    
}
