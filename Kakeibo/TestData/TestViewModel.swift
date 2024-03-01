//
//  TestViewModel.swift
//  Kakeibo
//
//  Created by 広瀬友哉 on 2024/03/01.
//

import Foundation

class TestViewModel: ObservableObject {
    @Published var model = TestModel(kakeiboModel: [KakeiboModel](), kakeiboLargeSmallCategory: [KakeiboLargeSmallCategory](), largeCategory: [LargeCategory](), smallCategory: [SmallCategory]())
    
    init(){
        setModelData()
    }
    
    func setModelData(){
        self.model.largeCategory.append(LargeCategory(id: "lc1", name: "買い物"))
        self.model.smallCategory.append(SmallCategory(id: "sc1", name: "晩飯"))
        self.model.smallCategory.append(SmallCategory(id: "sc2", name: "昼飯"))
        self.model.smallCategory.append(SmallCategory(id: "sc3", name: "材料"))
        self.model.smallCategory.append(SmallCategory(id: "sc4", name: "食事"))
        self.model.smallCategory.append(SmallCategory(id: "sc5", name: "交際"))
        
        self.model.kakeiboLargeSmallCategory.append(KakeiboLargeSmallCategory(id: "c1", kakeiboId: "case1", smallId: "sc1", largeId: "lc1"))
        self.model.kakeiboLargeSmallCategory.append(KakeiboLargeSmallCategory(id: "c2", kakeiboId: "case2", smallId: "sc2", largeId: "lc1"))
        self.model.kakeiboLargeSmallCategory.append(KakeiboLargeSmallCategory(id: "c3", kakeiboId: "case3", smallId: "sc3", largeId: "lc1"))
        self.model.kakeiboLargeSmallCategory.append(KakeiboLargeSmallCategory(id: "c4", kakeiboId: "case4", smallId: "sc4", largeId: "lc1"))
        self.model.kakeiboLargeSmallCategory.append(KakeiboLargeSmallCategory(id: "c5", kakeiboId: "case5", smallId: "sc1", largeId: "lc1"))
        self.model.kakeiboLargeSmallCategory.append(KakeiboLargeSmallCategory(id: "c6", kakeiboId: "case5", smallId: "sc5", largeId: "lc1"))
        
        self.model.kakeiboModel.append(KakeiboModel(id: "case1", name: "セブンイレブン弁当", price: 500, createAt: changeStringDate("2024/01/20 11:21:33"), updateAt: changeStringDate("2024/01/20 11:21:33"), categoryId: "c1", check: false))
        self.model.kakeiboModel.append(KakeiboModel(id: "case2", name: "ファミマ弁当", price: 300, createAt: changeStringDate("2024/02/20 11:22:33"), updateAt: changeStringDate("2024/02/20 11:22:33"), categoryId: "c2", check: false))
        self.model.kakeiboModel.append(KakeiboModel(id: "case3", name: "白菜", price: 100, createAt: changeStringDate("2024/02/20 11:23:33"), updateAt: changeStringDate("2024/02/20 11:23:33"), categoryId: "c3", check: false))
        self.model.kakeiboModel.append(KakeiboModel(id: "case4", name: "セブンイレブン弁当", price: 500, createAt: changeStringDate("2024/03/20 11:24:33"), updateAt: changeStringDate("2024/03/21 11:24:33"), categoryId: "c4", check: false))
        self.model.kakeiboModel.append(KakeiboModel(id: "case5", name: "フレンチレストラン", price: 5000, createAt: changeStringDate("2024/03/20 11:25:33"), updateAt: changeStringDate("2024/03/20 11:25:33"), categoryId: "c5", check: false))
    }
    
    func changeStringDate(_ dateString: String, _ dateFormatString: String = "yyyy/MM/dd HH:mm:ss")->Date{
        
        let dateFormatter = DateFormatter()
        
        // フォーマット設定
        dateFormatter.dateFormat = dateFormatString

        // ロケール設定（端末の暦設定に引きづられないようにする）
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")

        // タイムゾーン設定（端末設定によらず、どこの地域の時間帯なのかを指定する）
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")

        // 変換
//        let date = dateFormatter.date(from: "2020/10/20 11:22:33")
        let date = dateFormatter.date(from: dateString)

        // 結果表示
        print(date!) // -> 2020-10-20 02:22:33 +0000
        
        if let formatedDate = date {
            return formatedDate
        } else {
            return dateFormatter.date(from: "1999/09/28 00:00:00") ?? Date()
        }
        
    }
    
    func changeDateString(_ date: Date, _ dateFormatString: String = "yyyy/MM/dd HH:mm:ss")->String{
        
        let dateFormatter = DateFormatter()
        
        // フォーマット設定
        dateFormatter.dateFormat = dateFormatString

        // ロケール設定（端末の暦設定に引きづられないようにする）
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")

        // タイムゾーン設定（端末設定によらず、どこの地域の時間帯なのかを指定する）
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        
        let str = dateFormatter.string(from: date)
        
        if str.isEmpty {
            return changeDateString(Date())
        } else {
            return str
        }
    }
}
