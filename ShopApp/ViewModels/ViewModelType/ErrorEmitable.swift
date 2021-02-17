//
//  ErrorEmitable.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import RxSwift

protocol ErrorEmitable {
  var error: Observable<Error>! { get set }
  var errorTrigger: AnyObserver<Error>! { get set }
  var disposeBag: DisposeBag { get }
}
