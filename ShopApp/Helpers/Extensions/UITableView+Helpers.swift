//
//  UITableView+Helpers.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import RxSwift

extension UITableView {
  /// register the cell to the table view by passing the metatype
  func register<T: UITableViewCell>(_: T.Type) {
    let bundle = Bundle(for: T.self)
    let nib = UINib(nibName: T.nibName, bundle: bundle)
    register(nib, forCellReuseIdentifier: T.nibName)
  }

  /// register the cell to the table view by passing the metatype
  func registerWithoutNib<T: UITableViewCell>(_: T.Type) {
    register(T.self, forCellReuseIdentifier: T.nibName)
  }

  /// dequeue reusable cell by the returning type, the identifier will be the nib name
  func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(withIdentifier: T.nibName, for: indexPath) as? T else {
      fatalError("Could not dequeue cell with identifier: \(T.nibName)")
    }
    return cell
  }
}

protocol NibLoadableView {
  static var nibName: String { get }
}

extension UITableViewCell: NibLoadableView {
  static var nibName: String {
    return String(describing: self)
  }
}

extension Reactive where Base: UITableView {
  func items<Sequence: Swift.Sequence, Cell: UITableViewCell, Source: ObservableType>
    (cellType: Cell.Type = Cell.self)
    -> (_ source: Source)
    -> (_ configureCell: @escaping (Int, Sequence.Element, Cell) -> Void)
    -> Disposable
    where Source.Element == Sequence {
      return items(cellIdentifier: cellType.nibName, cellType: cellType)
  }
}
