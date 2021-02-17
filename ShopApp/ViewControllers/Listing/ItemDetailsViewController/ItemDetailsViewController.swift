//
//  ItemDetailsViewController.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import UIKit

class ItemDetailsViewController: BaseViewModelController<ItemDetailsViewModel> {
  
  // MARK: - IBOutlets

  @IBOutlet private weak var containerView: UIView!
  @IBOutlet private weak var nameLabel: AppLabel!
  @IBOutlet private weak var itemImageView: UIImageView!
  @IBOutlet private weak var priceLabel: AppLabel!
  
  // MARK: View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    observeForStatus()
    
    setup()
  }
  
  private func setup() {
    isBarTranslucent = true

    addBarButton(image: .love, selector: #selector(like), buttonPosition: .right)
    addBarButton(image: .back, selector: #selector(goBack), buttonPosition: .left)
  }
  
  // MARK: - Observers
  
  private func observeForStatus() {
    viewModel.status
      .subscribe(onNext: { [weak self] status in
        switch status {
        case let .itemLoaded(item):
          self?.updateView(with: item)
        case .liked:
          self?.liked()
        case .addedToCart:
          self?.addedToCart()
        case .none:
          break
        }
      })
      .disposed(by: disposeBag)
  }
  
  // MARK: -

  private func liked() {
    showNotImplementedYetDialog()
  }
  
  private func addedToCart() {
    showNotImplementedYetDialog()
  }
  
  private func updateView(with item: ListItemViewModel) {
    nameLabel.text = item.name
    priceLabel.text = item.price
    
    if let image = item.thumbnailUrl {
      itemImageView.contentMode = .center
      itemImageView.setImage(with: image, placeholderImage: UIImage(image: .shoppingCart)) { [weak self] in
        self?.itemImageView.contentMode = .scaleAspectFill
      }
    }
  }
  
  private func showNotImplementedYetDialog() {
    DialogView.show(in: view,
                    message: "common_not_implemented_yet".localized,
                    buttonTitle: "common_close".localized,
                    image: .cry)
  }
  
  // MARK: - Actions

  @objc
  private func like() {
    viewModel.like()
  }
  
  @objc
  private func goBack() {
    back()
  }
  
  // MARK: - Instance
  
  static func instance(item: ListItemViewModel) -> ItemDetailsViewController {
    let viewController = StoryboardUtil.create(storyboard: .main,
                                               controller: ItemDetailsViewController.self)
    viewController.viewModel.set(item: item)
    return viewController
  }
}
