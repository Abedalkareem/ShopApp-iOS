//
//  AppDelegate.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  // MARK: UIApplicationDelegate
  
  var window: UIWindow?
  
  // MARK: UIApplicationDelegate
  
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    checkArguments()
    return true
  }
  
  private func checkArguments() {
    let arguments = ProcessInfo.processInfo.arguments
    if arguments.contains("NoAnimations") {
      UIView.setAnimationsEnabled(false)

    }
  }
  
}

