//
//  ListingServices.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import RxSwift

class ListingServices: BaseServices {
  
  func getMainListItems(paginationKey: String = "") -> Observable<Result<ListItem>> {
    return fetcher.fetch(endpoint: ListingEndPoints.mainListItems(paginationKey: paginationKey))
  }
  
}
