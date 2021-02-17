//
//  ViewModelType.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import RxSwift

protocol ViewModelType {
  associatedtype Item
  var status: Observable<Item> { get set }
  var statusTrigger: AnyObserver<Item> { get set }
  var disposeBag: DisposeBag { get }
}
