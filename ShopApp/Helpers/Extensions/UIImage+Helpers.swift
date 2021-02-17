//
//  UIImage+Helpers.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import UIKit

extension UIImage {
  convenience init?(image: Images) {
    let bundle = Bundle(for: AppDelegate.self)
    self.init(named: image.rawValue, in: bundle, compatibleWith: nil)
  }
}
