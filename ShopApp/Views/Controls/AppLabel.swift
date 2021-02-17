//
//  AppLabel.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import UIKit

@IBDesignable
class AppLabel: UILabel {

  // MARK: - Properties

  @IBInspectable var localizeKey: String? {
    set {
      text = newValue?.localized
    }
    get {
      text
    }
  }
  
  // MARK: init

  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  
  private func setup() {
    textColor = .text
  }

}
