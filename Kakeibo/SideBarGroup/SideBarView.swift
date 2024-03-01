//
//  SideBarView.swift
//  Kakeibo
//
//  Created by 広瀬友哉 on 2024/03/01.
//

import SwiftUI

struct SideBarView: View {
    
    @ObservedObject var testVM: TestViewModel
    @State var selectedMonth: String = ""
    
    @State var year: Int =  (Int(MyTools().changeDateString(Date(), "yyyy")) ?? 2000)
    // 年のセレクト
    // 月のセレクタで分ける
    
    var body: some View {
        VStack{
            HStack{
                Button(action: { year -= 1 }, label: {
                    Text("<")
                })
                Text(String(year))
                Button(action: { year += 1 }, label: {
                    Text(">")
                })
            }
            List(){
                NavigationLink("ALL") {
                    ContentBarView(testVM: testVM)
                }
                ForEach(testVM.model.kakeiboModel){item in
                    NavigationLink(MyTools().changeDateString(item.createAt, "yyyy/MM")) {
                        ContentBarView(testVM: testVM)
                    }
                }
            }
        }
    }
}

#Preview {
    SideBarView(testVM: TestViewModel())
}
