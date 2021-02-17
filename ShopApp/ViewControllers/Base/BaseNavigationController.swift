//
//  BaseNavigationController.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import UIKit

class BaseNavigationController: UINavigationController {

  var style: Style = .white

  // MARK: - init

  init(rootViewController: UIViewController, style: Style = .white) {
    super.init(rootViewController: rootViewController)

    self.style = style
    setStyle()
  }

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setStyle()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setStyle()
  }

  private func setStyle() {
    let textAndIconsColor: UIColor = style == .white ? .text : .white
    navigationBar.isTranslucent = style == .white
    navigationBar.tintColor = textAndIconsColor
    navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: textAndIconsColor,
                                         NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .heavy)]
    navigationBar.shadowImage = UIImage()
    navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationBar.barTintColor = style == .white ? .white : .primary
  }
  
  // MARK: - View controllers helpers

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }

  override func present(_ viewControllerToPresent: UIViewController,
                        animated flag: Bool,
                        completion: (() -> Void)? = nil) {
    viewControllerToPresent.modalPresentationStyle = .fullScreen
    super.present(viewControllerToPresent, animated: flag, completion: completion)
  }
  
  enum Style {
    case white
    case primary
  }
}
