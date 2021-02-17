//
//  Constants.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import Foundation

enum Constants {
  
  enum urls {
    static let host = "ey3f2y0nre.execute-api.us-east-1.amazonaws.com"
    static let scheme = "https"
    static let path = "/default/"
  }
  
  enum errors {
    static var somethingWentWrong = NSError(domain: "shopapp",
                                            code: -990,
                                            userInfo: [NSLocalizedDescriptionKey:
                                              "generic_something_went_wrong_msg"])
    static var jsonSerializingFailure = NSError(domain: "shopapp", code: -991, userInfo: [NSLocalizedDescriptionKey:
                                                                                    "json_serializing_failure"])
  }
  
  enum strings {
    static let key = "$$amatoa"
  }
  
  enum ints { }
  
}
