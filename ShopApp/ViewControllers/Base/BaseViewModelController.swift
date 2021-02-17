//
//  BaseViewModelController.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import RxSwift
import UIKit

///
/// Any `ViewController` need to have a view model it should inherit this
/// class. this class will provid an injected `viewModel`.
///
/// An example:
/// ```
/// class SplashViewController: BaseViewModelController<SplashViewModel> {
///   .....
///   private func observeForItems() {
///     viewModel.items
///       .subscribe(onNext: {
///   .....
/// }
/// ```
///
class BaseViewModelController<ViewModel: ViewModelType>: BaseViewController {
  
  // MARK: - Properties
  
  @Injected var viewModel: ViewModel
  
  var disposeBag = DisposeBag()
  
  // MARK: - ViewController lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
   
    observeForErrors()
    observeForLoading()
  }
  
  // MARK: - Observers

  private func observeForErrors() {
    guard let errorEmitable = viewModel as? ErrorEmitable else {
      return
    }
    errorEmitable.error
      .subscribe(onNext: { [weak self] error in
        self?.showErrorDialog(with: error.localizedDescription)
      })
      .disposed(by: disposeBag)
  }
  
  private func observeForLoading() {
    guard let loadable = viewModel as? Loadable else {
      return
    }
    loadable.loading
      .subscribe(onNext: { [weak self] loading in
        self?.showLoading(with: loading)
      })
      .disposed(by: disposeBag)
  }
  
  // MARK: -

  ///
  /// Override to customize.
  ///
  func showErrorDialog(with message: String) {
    DialogView.show(in: view, message: message, buttonTitle: "common_close".localized)
  }
  
  ///
  /// Override to customize.
  ///
  func showLoading(with loading: Loading) {
    if loading.isLoading {
      LoadingView.show(in: view)
    } else {
      LoadingView.remove(from: view)
    }
  }
}
