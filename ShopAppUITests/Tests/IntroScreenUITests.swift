//
//  ShopAppUITests.swift
//  ShopAppUITests
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import XCTest

class ShopAppUITests: XCTestCase {
  
  override func setUpWithError() throws {
    continueAfterFailure = false
  }
  
  override func tearDownWithError() throws {

  }
  
  func testExample() throws {
    // UI tests must launch the application that they test.
    let app = XCUIApplication()
    app.launch()
    
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
//    XCUIApplication().staticTexts["Shop now !"].tap()
////    XCUIApplication().
//
    XCUIApplication().buttons["Shop now !"].tap()
    
  }
  
}
