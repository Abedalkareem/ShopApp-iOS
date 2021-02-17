//
//  MockCommonAssembly.swift
//  ShopAppTests
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import Swinject
import SwinjectAutoregistration
@testable import ShopApp

class MockCommonAssembly: Assembly {
  func assemble(container: Container) {
    container.autoregister(FetcherType.self, initializer: Fetcher.init)
    container.autoregister(NetworkingType.self, initializer: MockHttpClient.init)
  }
}
