//
//  SideBarView.swift
//  Kakeibo
//
//  Created by 広瀬友哉 on 2024/03/01.
//

import SwiftUI

struct SideBarView: View {
    
    @ObservedObject var testVM: TestViewModel
//    @State var selectedMonth: [String] = MyTools().getYearDate(year:  (Int(MyTools().changeDateString(Date(), "yyyy")) ?? 2000))
    
    @State var year: Int =  (Int(MyTools().changeDateString(Date(), "yyyy")) ?? 2000)
    // 年のセレクト
    // 月のセレクタで分ける
    @State var reView: Bool = false
    
    var body: some View {
        VStack{
            HStack{
                Button(action: { 
                    year -= 1
                    testVM.model.selectedMonth = MyTools().getYearDate(year: year)
                    self.reView.toggle()
                }, label: {
                    Text("<")
                })
                Text(String(year))
                Button(action: { 
                    year += 1
                    testVM.model.selectedMonth = MyTools().getYearDate(year: year)
                    self.reView.toggle()
                }, label: {
                    Text(">")
                })
            }
            List(){
                
                NavigationLink("ALL", value: "ALL")
                
                ForEach(testVM.model.selectedMonth, id: \.self){item in
                    NavigationLink(item, value: item)
                }
                
            }.navigationDestination(for: String.self) { Hashable in
                if Hashable == "ALL" {
                    Text("ALL")
                }else{
                    ContentBarView(testVM: testVM, selectDate: Hashable)
                }
            }
        }
    }
}

#Preview {
    SideBarView(testVM: TestViewModel())
}
