//
//  UIImageView+Helpers.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import Kingfisher
import UIKit

extension UIImageView {

  ///
  /// Load an image from an url.
  /// - Parameters:
  ///   - url: An image url to load.
  ///   - placeholderImage: place holder to set until the image loaded.
  ///
  func setImage(with url: URL,
                placeholderImage: UIImage? = nil,
                completion: (() -> Void)? = nil) {
    kf.setImage(with: url, placeholder: placeholderImage) { result in
      completion?()
    }
  }

}
