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
    
    func getYearDate(year: Int)->[String] {

        var dateString: [String] = []
        
        // DateFormatterの設定
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY/MM" // 出力形式

        // Calendarインスタンスの取得
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "Asia/Tokyo")!
        // 2023年の各月の最初の日を生成し、それを指定した形式で出力
        for month in 1...12 {
            var dateComponents = DateComponents()
            dateComponents.year = year
            dateComponents.month = month
            dateComponents.day = 1
            dateComponents.hour = 0
            dateComponents.minute = 0
            dateComponents.second = 0
            
            // DateComponentsからDateを生成
            if let date = calendar.date(from: dateComponents) {
                // Dateを指定した形式の文字列に変換
                dateString.append( dateFormatter.string(from: date) )
            } else {
                dateString.append("1999/09")
            }
        }
//        print(dateString)
        return dateString
    }
    
    func getDayDates(yearMonth: String) -> [String] {
        var dateStrings: [String] = []

        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "yyyy/MM"
        inputDateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo") // UTCタイムゾーンを設定

        if let date = inputDateFormatter.date(from: yearMonth) {
            let calendar = Calendar.current
            let range = calendar.range(of: .day, in: .month, for: date)!
            
            let outputDateFormatter = DateFormatter()
            outputDateFormatter.dateFormat = "yyyy/MM/dd"
            outputDateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo") // UTCタイムゾーンを設定
            
            for day in range {
                if let dayDate = calendar.date(bySetting: .day, value: day, of: date) {
                    let dateString = outputDateFormatter.string(from: dayDate)
                    dateStrings.append(dateString)
                    print(dateString)
                }
            }
        } else {
            print("Invalid date format")
        }

        print(dateStrings)
        
        return dateStrings
    }
}
