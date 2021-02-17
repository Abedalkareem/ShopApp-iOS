//
//  UIViewController+Helpers.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import UIKit

extension UIViewController {

  var rootViewController: UIViewController? {
    return UIApplication.shared.keyWindow?.rootViewController
  }

  ///
  /// Use it to change the root view controller.
  /// - Parameter viewController: A view controller to set as a root.
  /// - Parameter animated: A bool value to determine either changing the view controller
  ///  should set as root with animation or not.
  ///
  func setRootViewController(viewController: UIViewController?, animated: Bool) {
    
    guard let window = UIApplication.shared.keyWindow else {
      return
    }
    
    guard animated else {
      window.rootViewController = viewController
      return
    }
    
    let snapshot = self.view.snapshotView(afterScreenUpdates: true)!
    
    viewController?.view.addSubview(snapshot);
    
    window.rootViewController = viewController;
    
    UIView.animate(withDuration: 0.3, animations: {() in
      snapshot.layer.opacity = 0;
    }, completion: {
      (value: Bool) in
      snapshot.removeFromSuperview();
    });
  }

}
