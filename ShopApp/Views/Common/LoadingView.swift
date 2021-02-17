//
//  LoadingView.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import UIKit

@IBDesignable
class LoadingView: UIView {
  
  // MARK: - Properties
  
  private var imageView: UIImageView!
  
  private var timer: Timer?
  private var images: [Images] = [.smartWatch, .keyboard, .laptop, .ps4, .streamingTv]
  private var index = 0
  
  // MARK: - init
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  
  private func setup() {
    imageView = UIImageView()
    imageView.image = UIImage(image: .smartWatch)
    addSubview(imageView)
    
    makeConstraints()
  }
  
  private func makeConstraints() {
    imageView.matchParent()
  }
  
  // MARK: Private
  
  @objc
  private func tick() {
    index += 1
    if index >= images.count {
      index = 0
    }
    imageView.image = UIImage(image: images[index])
  }
  
  // MARK: Public
  
  func animate() {
    isHidden = false
    timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
  }
  
  func stop() {
    isHidden = true
    timer?.invalidate()
    timer = nil
  }
  
  static func show(in view: UIView) {
    let loadingView = LoadingView()
    view.addSubview(loadingView)
    
    loadingView.animate()
    loadingView.activate([
      loadingView.centerY.constraint(equalTo: view.centerY),
      loadingView.centerX.constraint(equalTo: view.centerX),
      loadingView.width.constraint(equalToConstant: 100),
      loadingView.height.constraint(equalToConstant: 100),
    ])
  }
  
  static func remove(from view: UIView) {
    view.subviews.compactMap({ $0 as? LoadingView }).first?.removeFromSuperview()
  }
  
  // MARK: deinit
  
  deinit {
    stop()
  }
}
