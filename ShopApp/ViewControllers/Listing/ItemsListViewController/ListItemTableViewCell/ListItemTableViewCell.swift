//
//  ListItemTableViewCell.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import UIKit

class ListItemTableViewCell: UITableViewCell {
  
  // MARK: - IBOutlets

  @IBOutlet private weak var containerView: CardView!
  @IBOutlet private weak var nameLabel: AppLabel!
  @IBOutlet private weak var itemImageView: UIImageView!
  @IBOutlet private weak var priceLabel: AppLabel!
  
  // MARK: View lifecycle

  override func awakeFromNib() {
    super.awakeFromNib()

    selectionStyle = .none
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    itemImageView.roundedCorner()
  }
  
  // MARK: - Setup
  
  func setup(with item: ListItemViewModel) {
    
    nameLabel.text = item.name
    priceLabel.text = item.price
    
    if let image = item.thumbnailUrl {
      itemImageView.contentMode = .center
      itemImageView.setImage(with: image, placeholderImage: UIImage(image: .shoppingCart)) { [weak self] in
        self?.itemImageView.contentMode = .scaleAspectFill
      }
    }
  }

}
