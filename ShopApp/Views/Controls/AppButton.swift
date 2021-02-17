//
//  AppButton.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import UIKit

@IBDesignable
class AppButton: UIButton {
  
  // MARK: - Properties

  @IBInspectable var localizeKey: String? {
    didSet {
      setTitle(localizeKey?.localized, for: .normal)
    }
  }
  
  @IBInspectable var isPlain: Bool = false {
    didSet {
      if isPlain {
        backgroundColor = .secondary
        setTitleColor(.primary, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        heightConstraint.constant = 30
      }
    }
  }
  
  @IBInspectable var isPlainText: Bool = false {
    didSet {
      if isPlainText {
        backgroundColor = .secondary
        setTitleColor(.text, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        heightConstraint.constant = 30
      }
    }
  }
  
  var isLoading: Bool = false {
    didSet {
      isEnabled = !isLoading
      setTitle(isLoading ? "" : localizeKey?.localized, for: .normal)
      if isLoading {
        loadingView.animate()
      } else {
        loadingView.stop()
      }
    }
  }
  
  // MARK: - Private properties

  private var loadingView: LoadingView!
  private var heightConstraint: NSLayoutConstraint!
  
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
    
    titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)

    backgroundColor = .tertiary
    setTitleColor(.secondary, for: .normal)
    
    loadingView = LoadingView()
    addSubview(loadingView)
    
    isLoading = false
    
    makeConstraints()
  }
  
  private func makeConstraints() {
    heightConstraint = heightAnchor.constraint(equalToConstant: 50)
    heightConstraint.isActive = true
    
    loadingView.center()
    loadingView.setSize(size: 30)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    roundedCorner()
  }
  
  override func prepareForInterfaceBuilder() {
    setup()
  }
}
