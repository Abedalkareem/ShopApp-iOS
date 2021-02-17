//
//  ServicesAssembly.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import Swinject
import SwinjectAutoregistration

class ServicesAssembly: Assembly {
  func assemble(container: Container) {
    container.autoregister(ListingServices.self, initializer: ListingServices.init)
  }
}
