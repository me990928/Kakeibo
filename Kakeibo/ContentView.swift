//
//  ContentView.swift
//  Kakeibo
//
//  Created by 広瀬友哉 on 2024/02/27.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @State var addSheetFlag: Bool = false
    
    @StateObject var testVM = TestViewModel()

    var body: some View {
        NavigationSplitView {
            SideBarView(testVM: testVM)
        } content: {
            ContentBarView(testVM: testVM, selectDate: MyTools().changeDateString(Date(), "yyyy/MM"))
        } detail: {
            Text("Main Contents")
        }.sheet(isPresented: $addSheetFlag, content: {
            // デバッグ用シート
            VStack{
                // 大カテゴリ
                Divider()
                // 小カテゴリ
                Divider()
                // 家計簿挿入
                Divider()
            }
        })
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}

struct CategoryView:View {
    
    let mode: Int
    
    @Environment(\.modelContext) private var modelContext
    @Query private var large: [LargeCategory]
    @Query private var small: [SmallCategory]
    
    var body: some View {
        VStack{
        }
    }
}
