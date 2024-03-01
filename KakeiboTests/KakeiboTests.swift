//
//  KakeiboTests.swift
//  KakeiboTests
//
//  Created by 広瀬友哉 on 2024/02/27.
//
import SwiftData
import XCTest
@testable import Kakeibo

final class KakeiboTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
            // Put setup code here. This method is called before the invocation of each test method in the class.
            
            
            // 1. Model 定義の型情報で Schema を初期化
            let schema = Schema([SmallCategory.self])
            // 2. Schema で ModelConfiguration を初期化
            let modelConfiguration = ModelConfiguration(schema: schema)
            // 3. ModelConfiguration で ModelContainer で初期化
            let modelContainer = try! ModelContainer(
              for: SmallCategory.self,
              configurations: modelConfiguration
            )
            // 4. ModelContainer で ModelContext で初期化
            let modelContext = ModelContext(modelContainer)

            // ModelContext.autosaveEnabled が有効になっていると
            // 現在のメインスレッドの　RunLoop が終わったタイミングなどで自動的に保存されます
            // デフォルト値は true です
            modelContext.autosaveEnabled = true
            
            // テストデータ
            let name = "テストカテゴリ"
            
            // DataCRUDクラスのインスタンス生成
            let crud = DataCRUD()
            
            // データ挿入
            crud.addSmallCategoryData(mc: modelContext, name: name)
            
            // データ取得
            let request = FetchDescriptor<SmallCategory>()
            let results = try! modelContext.fetch(request)
            
            // データ存在確認
            XCTAssertTrue(results.count > 0)
            
            // データ内容確認
            let firstResult = results[0]
            XCTAssertEqual(firstResult.name, name)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
