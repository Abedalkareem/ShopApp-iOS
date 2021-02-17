//
//  ItemDetailsViewModel.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import RxSwift

class ItemDetailsViewModel: ViewModelType {
  
  // MARK: - Properties

  var status: Observable<Status?>
  var statusTrigger: AnyObserver<Status?>
  
  var disposeBag: DisposeBag
  
  // MARK: - init

  init() {
    
    disposeBag = DisposeBag()
    
    let statusPublishSubject = BehaviorSubject<Status?>(value: nil)
    status = statusPublishSubject.asObservable()
    statusTrigger = statusPublishSubject.asObserver()
  
  }
  
  func set(item: ListItemViewModel) {
    self.statusTrigger.on(.next(.itemLoaded(item)))
  }
  
  // MARK: -
  
  func like() {
    statusTrigger.on(.next(.liked))
  }
  
  func addToCart() {
    statusTrigger.on(.next(.addedToCart))
  }
  
  // MARK: - Enum

  enum Status {
    case itemLoaded(ListItemViewModel)
    case liked
    case addedToCart
  }
}

