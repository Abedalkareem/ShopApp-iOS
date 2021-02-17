//
//  String+Helpers.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import Foundation

extension String {
  var localized: String {
    let bundle = Bundle(for: AppDelegate.self)
    return bundle.localizedString(forKey: self, value: "", table: nil)
  }
}
