//
//  JSONReader.swift
//  ShopAppTests
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import Foundation

class JSONReader {
  
  func readJSONFileWith(name: String) -> Data? {
    
    guard let path = Bundle(for: type(of: self))
      .path(forResource: name, ofType: "json") else {
        return nil
    }
    
    return try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
  }
}
