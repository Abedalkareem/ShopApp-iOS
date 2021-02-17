//
//  ListItem.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import Foundation

struct ListItem {
  let name: String
  let price: String
  let uid: String
  let createdAt: String
  let imageIds: [String]
  let imageUrls: [String]
  let imageUrlsThumbnails: [String]
}

extension ListItem: Decodable {
  enum CodingKeys: String, CodingKey {
    case name
    case price
    case uid
    case createdAt = "created_at"
    case imageIds = "image_ids"
    case imageUrls = "image_urls"
    case imageUrlsThumbnails = "image_urls_thumbnails"
  }
}
