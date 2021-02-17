//
//  ObservableType+Helpers.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import RxSwift

extension ObservableType {
  func emitErrorTo<O: ObserverType>(_ subject: O?) -> Observable<Element> where O.Element == Error {
    return asObservable().do(onError: { error in
      subject?.on(.next(error))
    })
  }
  
  func emitTo<T, O: ObserverType>(_ subject: O?,
                                  value: T) -> Observable<Element> where O.Element == T {
    return asObservable().do(onNext: { _ in
      subject?.on(.next(value))
    })
  }
  
  func catchError<T, O: ObserverType>(_ subject: O?,
                                      value: T?) -> Observable<Element> where O.Element == T {
    return `catch` { _ in
      if let value = value {
        subject?.on(.next(value))
      }
      return Observable.empty()
    }
  }
  
  func catchError() -> Observable<Element> {
    return `catch` { _ in Observable.empty() }
  }
}
