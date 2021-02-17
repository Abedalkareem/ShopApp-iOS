//
//  BaseUITests.swift
//  ShopAppUITests
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import XCTest

class BaseUITests: XCTestCase {

  var app: XCUIApplication!

  override func setUp() {
    super.setUp()
    
    app = XCUIApplication()
    app.launchArguments = ["NoAnimations"]
  }
  
}
