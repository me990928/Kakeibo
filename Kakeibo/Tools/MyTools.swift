//
//  MyTools.swift
//  Kakeibo
//
//  Created by 広瀬友哉 on 2024/03/01.
//

import Foundation

class MyTools {
    
    
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
