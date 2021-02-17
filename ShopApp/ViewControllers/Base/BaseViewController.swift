//
//  BaseViewController.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import UIKit

class BaseViewController: UIViewController {

  var isBarTranslucent: Bool {
    get {
      navigationController?.navigationBar.isTranslucent ?? false
    }
    set {
      navigationController?.navigationBar.isTranslucent = newValue
    }
  }
  

  
  // MARK: - ViewController lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    
  }

  // MARK: - View controllers helpers

  ///
  /// Add a bar button on the top for the view controller.
  /// - Parameter tintColor: The default value is primary color.
  /// - Parameter image: Image to show on the button.
  /// - Parameter selector: An action to happen when the user click on the button.
  /// - Parameter buttonPosition: The postion of the button (`right`/`left`) side of the
  /// navigation bar.
  /// - Parameter width: Width of the button.
  /// - Parameter height: Height of the buttton.
  ///
  func addBarButton(image: Images,
                    selector: Selector,
                    buttonPosition: ButtonPosition,
                    width: CGFloat = 30,
                    height: CGFloat = 30,
                    tintColor: UIColor? = nil) {
    let button = UIButton()
    button.setImage(UIImage(image: image), for: .normal)
    var tintColor = tintColor
    if tintColor == nil {
      tintColor = (navigationController as? BaseNavigationController)?.style == .white ?
        .primary : .white
    }
    button.tintColor = tintColor
    button.widthAnchor.constraint(equalToConstant: width).isActive = true
    button.heightAnchor.constraint(equalToConstant: height).isActive = true
    let barButton = UIBarButtonItem(customView: button)
    button.addTarget(self, action: selector, for: .touchUpInside)
    navigationItem.hidesBackButton = true
    if buttonPosition == .right {
      navigationItem.rightBarButtonItem = barButton
    } else {
      navigationItem.leftBarButtonItem = barButton
    }
  }
  
  ///
  /// You can override this method to do extra things before
  /// when the close button pressed.
  ///
  @objc
  func close() {
    dismiss(animated: true, completion: nil)
  }

  ///
  /// You can override this method to do extra things before
  /// when the back button pressed.
  ///
  @objc
  func back() {
    navigationController?.popViewController(animated: true)
  }
  
  ///
  /// Presents a view controller modally.
  ///
  override func present(_ viewControllerToPresent: UIViewController,
                        animated flag: Bool,
                        completion: (() -> Void)? = nil) {
    viewControllerToPresent.modalPresentationStyle = .fullScreen
    super.present(viewControllerToPresent, animated: flag, completion: completion)
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    view.endEditing(true)
  }
  
  // MARK: - Enums

  enum ButtonType {
    case pop
    case dismiss
  }

  enum ButtonPosition {
    case left
    case right
  }
}
