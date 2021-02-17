//
//  ListItemViewModel.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import UIKit

class ListItemViewModel {
  
  let name: String
  let price: String
  let createdAt: Date
  let imageUrl: URL?
  let thumbnailUrl: URL?
  
  init(_ item: ListItem) {
    name = item.name
    price = item.price
    createdAt = Date()
    imageUrl = URL(string: item.imageUrls.first ?? "")
    thumbnailUrl = URL(string: item.imageUrlsThumbnails.first ?? "")
  }
  
}
