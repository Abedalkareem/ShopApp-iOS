//
//  Result.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import Foundation

struct Result<T: Decodable>: Decodable {
  let results: [T]
}
