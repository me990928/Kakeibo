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
    
    // selector
    var selectedMonth: [String] = MyTools().getYearDate(year:  (Int(MyTools().changeDateString(Date(), "yyyy")) ?? 2000))
    var selectedDate: [String] = MyTools().getDayDates(yearMonth: MyTools().changeDateString(Date(), "yyyy/MM"))
}
