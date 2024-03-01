//
//  SideBarView.swift
//  Kakeibo
//
//  Created by 広瀬友哉 on 2024/03/01.
//

import SwiftUI

struct SideBarView: View {
    
    @ObservedObject var testVM: TestViewModel
    
    var body: some View {
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

#Preview {
    SideBarView(testVM: TestViewModel())
}
