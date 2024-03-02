//
//  ContentBarView.swift
//  Kakeibo
//
//  Created by 広瀬友哉 on 2024/03/01.
//

import SwiftUI

struct ContentBarView: View {
    
    @ObservedObject var testVM: TestViewModel
    var selectDate: String
    
    var body: some View {
        List(){
            ForEach(MyTools().getDayDates(yearMonth: selectDate), id: \.self){item in
                NavigationLink(item) {
                    
                }
            }
        }
    }
}

#Preview {
    ContentBarView(testVM: TestViewModel(), selectDate: "1999/09")
}
