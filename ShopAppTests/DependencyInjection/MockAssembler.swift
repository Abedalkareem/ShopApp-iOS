//
//  MockAssembler.swift
//  ShopAppTests
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import Swinject
@testable import ShopApp

extension Assembler {
  static let mockShared: Assembler = {
    let container = Container()
    let assemblies: [Assembly] = [MockCommonAssembly(), ServicesAssembly()] + viewModelsAssemblies
    let assembler = Assembler(assemblies, container: container)
    return assembler
  }()
}
