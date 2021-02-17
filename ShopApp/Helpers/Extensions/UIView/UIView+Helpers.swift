//
//  UIView+Helpers.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import UIKit

extension UIView {
  
  ///
  /// Make the view circular.
  ///
  func makeCircular() {
    layer.cornerRadius = bounds.size.width / 2
    layer.masksToBounds = true
  }
  
  ///
  /// Round the edges of the view with `radius`.
  ///
  func roundedCorner(radius: CGFloat = 24, mask: Bool = true) {
    layer.cornerRadius = radius
    layer.masksToBounds = mask
  }
  
  ///
  /// Add a border to the view.
  /// - Parameter color: The color of the border, the default is white.
  /// - Parameter width: The width of the border, the default is `2`.
  ///
  func addBorder(color: UIColor = .white, width: CGFloat = 2) {
    layer.borderColor = color.cgColor
    layer.borderWidth = width
  }
  
  ///
  /// Add shadow and make the corner rounded for the view.
  /// - Parameter isWithBackground: To determine if the view should have a background, the default is `true`.
  /// - Parameter isWithRoundedCorner: To determine if the view should have a rounded corners `true`.
  /// - Parameter cornerRadius: The corner radius, the default is `11`.
  ///
  func makeCardView(isWithBackground: Bool = true, isWithRoundedCorner: Bool = true, cornerRadius: CGFloat = 11) {
    if isWithBackground {
      backgroundColor = .white
    }
    if isWithRoundedCorner {
      layer.cornerRadius = cornerRadius
    }
    let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
    
    layer.masksToBounds = false
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOffset = CGSize(width: 0, height: 0)
    layer.shadowOpacity = 0.3
    layer.shadowPath = shadowPath.cgPath
  }
  
}
