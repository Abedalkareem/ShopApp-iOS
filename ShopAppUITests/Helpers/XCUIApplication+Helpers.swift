//
//  XCUIApplication+Helpers.swift
//  ShopAppUITests
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import XCTest
@testable import ShopApp

extension XCUIApplication {
  var isDisplayingItemsListViewController: Bool {
    return otherElements["ItemsListViewController"].exists
  }
}
