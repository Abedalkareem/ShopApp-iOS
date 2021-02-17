//
//  DialogView.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import UIKit

class DialogView: UIView {
  
  typealias ButtonClicked = () -> Void
  
  // MARK: - Properties
  
  var message: String = "" {
    didSet {
      messageLabel.text = message
    }
  }
  
  var buttonTitle: String = "" {
    didSet {
      button.setTitle(buttonTitle, for: .normal)
    }
  }
  
  var image: Images = .love {
    didSet {
      emojiImageView.image  = UIImage(image: image)
    }
  }

  // MARK: - Private properties

  var containerView: UIView!
  var backgroundView: UIView!
  var messageLabel: AppLabel!
  var emojiImageView: UIImageView!
  var button: AppButton!
  var buttonClicked: ButtonClicked?

  // MARK: init

  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  
  func setup() {
    
    backgroundView = UIView()
    backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.0)
    addSubview(backgroundView)

    containerView = UIView()
    containerView.backgroundColor = .secondary
    containerView.alpha = 0
    addSubview(containerView)
    
    messageLabel = AppLabel()
    messageLabel.font = .systemFont(ofSize: 19, weight: .medium)
    messageLabel.textAlignment = .center
    messageLabel.numberOfLines = 0
    containerView.addSubview(messageLabel)
    
    emojiImageView = UIImageView()
    emojiImageView.image  = UIImage(image: .love)
    emojiImageView.alpha = 0
    addSubview(emojiImageView)
    
    button = AppButton()
    button.titleLabel?.font = .systemFont(ofSize: 19, weight: .heavy)
    button.addTarget(self, action: #selector(actionPressed), for: .touchUpInside)
    containerView.addSubview(button)
    
    makeConstraints()
  }
  
  private func makeConstraints() {
    backgroundView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      backgroundView.topAnchor.constraint(equalTo: topAnchor),
      backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
      backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
      backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
    ])
    
    containerView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      containerView.centerY.constraint(equalTo: centerY),
      containerView.centerX.constraint(equalTo: centerX),
      containerView.leading.constraint(equalTo: leading, constant: 32)
    ])
    
    messageLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      messageLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 65),
      messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 50),
      messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -50),
    ])
    
    button.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      button.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -30),
      button.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 50),
      button.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -50),
      button.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16),
    ])
    
    emojiImageView.activate([
      emojiImageView.width.constraint(equalToConstant: 110),
      emojiImageView.height.constraint(equalToConstant: 110),
      emojiImageView.top.constraint(equalTo: containerView.top, constant: -55),
      emojiImageView.centerX.constraint(equalTo: containerView.centerX)
    ])
  }
  
  @objc
  private func actionPressed() {
    buttonClicked?()
    self.removeFromSuperview()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    containerView.roundedCorner()
  }
  
  fileprivate func show() {
    containerView.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
    emojiImageView.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
    UIView.animate(withDuration: 0.5,
                   delay: 0,
                   usingSpringWithDamping: 0.3,
                   initialSpringVelocity: 0.2,
                   options: [.curveEaseInOut]) {
      self.containerView.alpha = 1
      self.containerView.transform = .identity
      self.emojiImageView.alpha = 1
      self.emojiImageView.transform = .identity
      self.backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    } completion: { _ in

    }

  }
  
  static func show(in view: UIView, message: String, buttonTitle: String, image: Images = .love, buttonClicked: ButtonClicked? = nil) {
    let dialogView = DialogView()
    dialogView.buttonTitle = buttonTitle
    dialogView.message = message
    dialogView.image = image
    dialogView.buttonClicked = buttonClicked
    view.addSubview(dialogView)
    
    dialogView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      dialogView.topAnchor.constraint(equalTo: view.topAnchor),
      dialogView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      dialogView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      dialogView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    ])
    
    dialogView.show()
  }
  
}

