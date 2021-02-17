//
//  MockHttpClient.swift
//  ShopAppTests
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import Foundation
@testable import ShopApp

class MockHttpClient: NetworkingType {

  private let jsonReader: JSONReader

  init() {
    jsonReader = JSONReader()
  }

  ///
  /// Make a request and return a result or failure.
  /// - Parameter request: A url request to execute.
  /// - Parameter completion: A cluser will get call after the request finish.
  /// It will return `Error` in case of failure, and `Data` in case of success.
  ///
  func request(_ request: URLRequest?, completion: @escaping (Error?, Data?) -> Void) {
    let fileName = request!.url!.path.components(separatedBy: "/").last!
    let json = jsonReader.readJSONFileWith(name: fileName)
    completion(nil, json)
  }
}
