//
//  IntroView.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import UIKit

class IntroView: UIView {
  
  // MARK: - Properties
  
  private var backgroundLayer: CAShapeLayer!
  private var ballotImageView: UIImageView!

  private var images: [Images] = [.smartWatch, .keyboard, .laptop, .ps4, .streamingTv]
  private var timer: Timer?

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
    backgroundLayer = CAShapeLayer()
    backgroundLayer.fillColor = UIColor.primary.cgColor
    layer.addSublayer(backgroundLayer)
    
    ballotImageView = UIImageView()
    ballotImageView.contentMode = .scaleAspectFit
    ballotImageView.image = UIImage(image: .shoppingCart)
    addSubview(ballotImageView)
    
    makeConstraints()
  }
  
  private func makeConstraints() {
    ballotImageView.center()
    ballotImageView.setSize(size: 110)
  }
  
  override func draw(_ rect: CGRect) {
    backgroundLayer.path = roundedPath()
  }
  
  // MARK: - Paths
  
  private func roundedPath() -> CGPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 0, y: bounds.midY))
    path.addQuadCurve(to: CGPoint(x: bounds.midX / 2, y: 0),
                      controlPoint: CGPoint(x: 0, y: 0))
    path.addQuadCurve(to: CGPoint(x: bounds.width, y: bounds.midY),
                      controlPoint: CGPoint(x: bounds.width, y: 0))
    path.addQuadCurve(to: CGPoint(x: bounds.midX, y: bounds.height),
                      controlPoint: CGPoint(x: bounds.width, y: bounds.height))
    path.addQuadCurve(to: CGPoint(x: 0, y: bounds.midY),
                      controlPoint: CGPoint(x: 0, y: bounds.height))
    path.close()
    return path.cgPath
  }
  
  // MARK: - Private
  
  @objc
  private func tick() {
    let image = images.randomElement() ?? .keyboard
    let size = CGFloat(40)
    let x = CGFloat.random(in: 0...frame.width)
    let y = CGFloat.random(in: 0...frame.height)
    let toX = bounds.midX - 20
    let toY = ballotImageView.frame.size.height / 4
    let imageView = UIImageView(frame: CGRect(x: x,
                                              y: y,
                                              width: size,
                                              height: size))
    imageView.image = UIImage(image: image)
    addSubview(imageView)
    
    UIView.animate(withDuration: 0.3,
                   delay: 0,
                   options: [.curveEaseIn]) {
      imageView.frame = CGRect(x: toX,
                               y: toY,
                               width: 40,
                               height: 40)
    } completion: { _ in
      imageView.removeFromSuperview()
    }
  }
  
  // MARK: - Public

  func start() {
    timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
  }

  func stop() {
    timer?.invalidate()
    timer = nil
  }
  
  // MARK: - deinit

  deinit {
    stop()
  }
}
