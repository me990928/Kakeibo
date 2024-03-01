//
//  KakeiboModel.swift
//  Kakeibo
//
//  Created by 広瀬友哉 on 2024/02/27.
//

import Foundation
import SwiftData

@Model
final class KakeiboModel {
    var id: String
    var name: String
    var price: Double
    var createAt: Date
    var updateAt: Date
    @Relationship(inverse: \KakeiboLargeSmallCategory.id) var categoryId: String
    var check: Bool
    
    init(id: String, name: String, price: Double, createAt: Date, updateAt: Date, categoryId: String, check: Bool) {
        self.id = id
        self.name = name
        self.price = price
        self.createAt = createAt
        self.updateAt = updateAt
        self.categoryId = categoryId
        self.check = check
    }
}

@Model
final class KakeiboLargeSmallCategory {
    var id: String
    @Relationship(inverse: \KakeiboModel.id) var kakeiboId: String
    @Relationship(inverse: \SmallCategory.id) var smallId: String?
    @Relationship(inverse: \LargeCategory.id)  var largeId: String?
    
    init(id: String, kakeiboId: String, smallId: String, largeId: String) {
        self.id = id
        self.kakeiboId = kakeiboId
        self.smallId = smallId
        self.largeId = largeId
    }
}

@Model
final class LargeCategory {
    var id: String
    var name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}

@Model
final class SmallCategory {
    var id: String
    var name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}

