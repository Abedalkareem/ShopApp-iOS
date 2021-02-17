//
//  CommonAssembly.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import Swinject
import SwinjectAutoregistration

class CommonAssembly: Assembly {
  func assemble(container: Container) {
    container.autoregister(FetcherType.self, initializer: Fetcher.init)
    container.autoregister(NetworkingType.self, initializer: HttpClient.init)
  }
}
