//
//  Loadable.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import RxSwift

protocol Loadable {
  var loading: Observable<Loading>! { get set }
  var loadingTrigger: AnyObserver<Loading>! { get set }
  var disposeBag: DisposeBag { get }
}

struct Loading {
  var isLoading: Bool
  var type: LoadingType
  
  init(_ isLoading: Bool, type: LoadingType = .fullScreen) {
    self.isLoading = isLoading
    self.type = type
  }
}

enum LoadingType {
  case fullScreen, button
}
