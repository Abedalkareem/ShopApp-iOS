//
//  NetworkingType.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import Foundation

protocol NetworkingType {

  func request(_ request: URLRequest?, completion: @escaping (Error?, Data?) -> Void)
}
