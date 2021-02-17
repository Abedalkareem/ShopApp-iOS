//
//  Assembler.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import Swinject

extension Assembler {
  static let shared: Assembler = {
    let container = Container()
    let assemblies: [Assembly] = [CommonAssembly(), ServicesAssembly()] + viewModelsAssemblies
    let assembler = Assembler(assemblies, container: container)
    return assembler
  }()
}
