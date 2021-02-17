//
//  UIView+Layout.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import UIKit

extension UIView {
  var trailing: NSLayoutXAxisAnchor {
    trailingAnchor
  }
  
  var leading: NSLayoutXAxisAnchor {
    leadingAnchor
  }
  
  var top: NSLayoutYAxisAnchor {
    topAnchor
  }
  
  var bottom: NSLayoutYAxisAnchor {
    bottomAnchor
  }
  
  var height: NSLayoutDimension {
    heightAnchor
  }
  
  var width: NSLayoutDimension {
    widthAnchor
  }
  
  var centerY: NSLayoutYAxisAnchor {
    centerYAnchor
  }
  
  var centerX: NSLayoutXAxisAnchor {
    centerXAnchor
  }
  
  func activate(_ constraints: [NSLayoutConstraint]) {
    self.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate(constraints)
  }
  
  func matchParent(topInset: CGFloat = 0,
                   bottomInset: CGFloat = 0,
                   leadingInset: CGFloat = 0,
                   trailingInset: CGFloat = 0) {
    guard let superview = superview else {
      fatalError("Please make sure to add it to superview")
    }
    activate([
      trailing.constraint(equalTo: superview.trailing, constant: -trailingInset),
      leading.constraint(equalTo: superview.leading, constant: leadingInset),
      top.constraint(equalTo: superview.top, constant: topInset),
      bottom.constraint(equalTo: superview.bottom, constant: -bottomInset),
    ])
  }
  
  func alignTopTrailing(topInset: CGFloat = 0, trailingInset: CGFloat = 0) {
    guard let superview = superview else {
      fatalError("Please make sure to add it to superview")
    }
    activate([
      trailing.constraint(equalTo: superview.trailing, constant: trailingInset),
      top.constraint(equalTo: superview.top, constant: topInset),
    ])
  }
  
  func alignTopLeading(topInset: CGFloat = 0, leadingInset: CGFloat = 0) {
    guard let superview = superview else {
      fatalError("Please make sure to add it to superview")
    }
    activate([
      leading.constraint(equalTo: superview.leading, constant: leadingInset),
      top.constraint(equalTo: superview.top, constant: topInset),
    ])
  }
  
  func centerTop(topInset: CGFloat = 0) {
    guard let superview = superview else {
      fatalError("Please make sure to add it to superview")
    }
    activate([
      centerX.constraint(equalTo: superview.centerX),
      top.constraint(equalTo: superview.top, constant: topInset),
    ])
  }
  
  func center() {
    guard let superview = superview else {
      fatalError("Please make sure to add it to superview")
    }
    activate([
      centerX.constraint(equalTo: superview.centerX),
      centerY.constraint(equalTo: superview.centerY),
    ])
  }
  
  func alignBottom(to view: UIView) {
    activate([
      leading.constraint(equalTo: view.leading),
      trailing.constraint(equalTo: view.trailing),
      bottom.constraint(equalTo: view.bottom),
    ])
  }
  
  func set(height: CGFloat) {
    activate([
      self.height.constraint(equalToConstant: height),
    ])
  }
  
  func setSize(size: CGFloat) {
    activate([
      width.constraint(equalToConstant: size),
      height.constraint(equalToConstant: size),
    ])
  }
  
}

