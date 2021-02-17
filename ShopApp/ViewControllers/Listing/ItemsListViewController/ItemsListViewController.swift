//
//  ItemsListViewController.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import UIKit

class ItemsListViewController: BaseViewModelController<ItemsListViewModel> {
  
  // MARK: - IBOutlets

  @IBOutlet private weak var tableView: UITableView!
  
  // MARK: View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setup()
    registerCells()
    
    observeForStatus()
    observeForModelSelected()
  }
  
  private func setup() {
    title = "items_list_screen_title".localized
    
    addBarButton(image: .shoppingCart, selector: #selector(showMyCart), buttonPosition: .right)
    addBarButton(image: .filter, selector: #selector(showFilter), buttonPosition: .left)
  }
  
  private func registerCells() {
    tableView.register(ListItemTableViewCell.self)
  }
  
  private func showNotImplementedYetDialog() {
    DialogView.show(in: view,
                    message: "common_not_implemented_yet".localized,
                    buttonTitle: "common_close".localized,
                    image: .cry)
  }
  
  // MARK: - Observers
  
  private func observeForStatus() {
    viewModel.status.bind(to: tableView.rx.items(cellType: ListItemTableViewCell.self)) { _, model, cell in
      cell.setup(with: model)
    }
    .disposed(by: disposeBag)
  }
  
  private func observeForModelSelected() {
    tableView.rx.modelSelected(ListItemViewModel.self)
      .subscribe(onNext: { [unowned self] item in
        self.showDetailsController(with: item)
      })
    .disposed(by: disposeBag)
  }
  
  // MARK: - Observers

  private func showDetailsController(with item: ListItemViewModel) {
    print(item.name)
  }
  
  // MARK: - Actions

  @objc
  private func showMyCart() {
    showNotImplementedYetDialog()
  }
  
  @objc
  private func showFilter() {
    showNotImplementedYetDialog()
  }
  
  // MARK: - Instance
  
  static func instance() -> ItemsListViewController {
    let viewController = StoryboardUtil.create(storyboard: .main,
                                               controller: ItemsListViewController.self)
    return viewController
  }
}
