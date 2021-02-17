//
//  BaseServices.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import RxSwift

class BaseServices {
  
  var fetcher: FetcherType
  
  init(fetcher: FetcherType) {
    self.fetcher = fetcher
  }
  
}
