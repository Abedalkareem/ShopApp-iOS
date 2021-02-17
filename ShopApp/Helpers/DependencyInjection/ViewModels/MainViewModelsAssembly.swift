//
//  MainViewModelsAssembly.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import Swinject
import SwinjectAutoregistration

class MainViewModelsAssembly: Assembly {
  func assemble(container: Container) {
    container.autoregister(ItemsListViewModel.self, initializer: ItemsListViewModel .init)
  }
}
