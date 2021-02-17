//
//  IntroViewController.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import UIKit

class IntroViewController: BaseViewController {

  // MARK: - IBOutlets

  @IBOutlet private weak var introView: IntroView!
  @IBOutlet private weak var shopNowButton: AppButton!
  
  // MARK: - View controller lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    setup()
  }
  
  private func setup() {
    introView.start()
  }

  // MARK: -

  private func showMainController() {
    
  }
  
  // MARK: - IBActions

  @IBAction private func shopNow(sender: Any?) {
    shopNowButton.isLoading = true
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
      self.shopNowButton.isLoading = false
      self.showMainController()
    }
  }
}

