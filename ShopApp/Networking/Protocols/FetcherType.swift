//
//  FetcherType.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import Foundation
import RxSwift

protocol FetcherType {

  func fetch<T: Decodable>(endpoint: EndPoint) -> Observable<T>
  func fetch(endpoint: EndPoint) -> Observable<Void>
}
