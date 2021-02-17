//
//  ListingEndPoints.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import Foundation

enum ListingEndPoints: EndPoint {
  case mainListItems(paginationKey: String)
  
  var method: HTTPMethod {
    switch self {
    case .mainListItems: return .get
    }
  }
  
  var path: String {
    switch self {
    case .mainListItems: return "dynamodb-writer"
    }
  }
  
  var parameters: Parameters {
    switch self {
    case let .mainListItems(paginationKey): return ["paginationKey": paginationKey]
    }
  }
  
}
