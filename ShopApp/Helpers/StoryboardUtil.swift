//
//  StoryboardUtil.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import UIKit

enum StoryboardUtil {
  
  static func create<T>(storyboard: Storyboard,
                        controller: T.Type,
                        bundle: Bundle? = Bundle.main) -> T {
    let uiStoryboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
    return uiStoryboard.instantiateViewController(withIdentifier: String(describing: controller.self)) as! T
  }
}

///
/// Storyboards used in the app, when you create new `Storyboard` you need to add it here
/// to use it.
///
enum Storyboard: String {
  case intro = "Intro"
  case main = "Main"
}
