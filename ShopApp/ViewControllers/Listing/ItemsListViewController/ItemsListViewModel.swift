//
//  ItemsListViewModel.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import RxSwift
import RxCocoa

class ItemsListViewModel: ViewModelType, Loadable, ErrorEmitable {
  
  // MARK: - Properties
  
  var loading: Observable<Loading>!
  var loadingTrigger: AnyObserver<Loading>!
  
  var error: Observable<Error>!
  var errorTrigger: AnyObserver<Error>!
  
  var disposeBag = DisposeBag()
  
  var status: Observable<[ListItemViewModel]>
  var statusTrigger: AnyObserver<[ListItemViewModel]>

  var searchText = BehaviorSubject(value: "")
  
  // MARK: Private properties
  
  private let services: ListingServices
  
  // MARK: - init

  init(services: ListingServices) {
    self.services = services
    
    let behaviorSubject = BehaviorSubject<Loading>(value: .init(true))
    loading = behaviorSubject.asObservable()
    loadingTrigger = behaviorSubject.asObserver()
    
    let errorPublishSubject = PublishSubject<Error>()
    error = errorPublishSubject.asObservable()
    errorTrigger = errorPublishSubject.asObserver()
    
    let statusBehaviorSubject = BehaviorSubject<[ListItemViewModel]>(value: [])
    status = statusBehaviorSubject.asObservable()
    statusTrigger = statusBehaviorSubject.asObserver()
    
    getMainListItems()
  }
  
  func getMainListItems() {
    loadingTrigger.on(.next(.init(true, type: .fullScreen)))
    services.getMainListItems()
      .emitErrorTo(self.errorTrigger)
      .catchError()
      .emitTo(loadingTrigger, value: .init(false, type: .fullScreen))
      .map({ $0.results })
      .map({ $0.map(ListItemViewModel.init) })
      .bind(to: statusTrigger)
      .disposed(by: disposeBag)
  }
 
}
