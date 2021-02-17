//
//  IntroScreenUITests.swift
//  ShopAppUITests
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import XCTest

class IntroScreenUITests: BaseUITests {
  
  override func setUpWithError() throws {
    continueAfterFailure = false
  }
  
  override func tearDownWithError() throws {

  }
  
  func testOpeningTheListScreen() throws {
    app.launch()
    
    let introScreenExpectation = self.expectation(description: "failed to load items list view controller to show")

    app.staticTexts["intro_screen_button".localized].tap()
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
      introScreenExpectation.fulfill()
    }
    
    waitForExpectations(timeout: 3)

    XCTAssertTrue(app.isDisplayingItemsListViewController)
  }
  
}
