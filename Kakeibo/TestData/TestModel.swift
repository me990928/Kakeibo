//
//  TestModel.swift
//  Kakeibo
//
//  Created by 広瀬友哉 on 2024/03/01.
//

import Foundation

struct TestModel {
    var kakeiboModel: [KakeiboModel]
    var kakeiboLargeSmallCategory: [KakeiboLargeSmallCategory]
    var largeCategory: [LargeCategory]
    var smallCategory: [SmallCategory]
    
    // flag
    var selectedMonth: String = ""
}
