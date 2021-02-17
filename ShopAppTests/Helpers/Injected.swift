//
//  Injected.swift
//  ShopAppTests
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import Foundation
import Swinject

@propertyWrapper
struct Injected<Value> {

  init() {
    self.wrappedValue = Assembler.mockShared.resolver.resolve(Value.self)!
  }

  var wrappedValue: Value
}
