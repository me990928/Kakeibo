//
//  KakeiboApp.swift
//  Kakeibo
//
//  Created by 広瀬友哉 on 2024/02/27.
//

import SwiftUI
import SwiftData

@main
struct KakeiboApp: App {
    
    @State var registUserFlag: Bool = false
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
            KakeiboModel.self,
            KakeiboLargeSmallCategory.self,
            LargeCategory.self,
            SmallCategory.self,
            Users.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView().sheet(isPresented: $registUserFlag) {
                UserRegistView(flag: $registUserFlag)
            }
        }
        .modelContainer(sharedModelContainer)
        .commands {
            CommandMenu("User") {
                Button("Regist User"){
                    print("Create user.")
                    self.registUserFlag.toggle()
                }.keyboardShortcut("U", modifiers: [.command, .option])
            }
        }
    }
}
