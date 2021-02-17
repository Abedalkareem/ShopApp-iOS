//
//  ItemsListViewModelTests.swift
//  ShopAppTests
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

@testable import ShopApp
import XCTest
import RxSwift
import RxBlocking

class ItemsListViewModelTests: XCTestCase {
  
  @Injected var viewModel: ItemsListViewModel

  var disposeBag: DisposeBag!

  override func setUpWithError() throws {
    disposeBag = DisposeBag()
  }
  
  func testFetchingItems() throws {
    
    let items: [ListItemViewModel]? = try? viewModel.status.toBlocking().first()
    XCTAssertNotEqual(items?.count, 0)
  }
  
}
