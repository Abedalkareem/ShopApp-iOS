//
//  Obfuscator.swift
//  ShopApp
//
//  Created by abedalkareem omreyh on 17/02/2021.
//

import Foundation

enum Obfuscator {

  /// deobfuscate the bytes array `obfuscatedChars` to the key using the `cipher` string.
  ///
  /// - parameter cipher: The key that will be used to deobfuscate the bytes array.
  /// - parameter obfuscatedChars: The bytes array to deobfuscate
  ///
  static func deObfuscate(_ obfuscatedChars: [UInt8], _ cipher: String = Constants.strings.key) -> String {
    let cipher = [UInt8](cipher.utf8)
    var bytes = [UInt8]()
    obfuscatedChars.enumerated().forEach { item in
      bytes.append(item.element ^ cipher[item.offset % cipher.count])
    }
    return String(bytes: bytes, encoding: .utf8)!
  }

  static func obfuscate(_ string: String, _ cipher: String) -> [UInt8] {
    let cipher = [UInt8](cipher.utf8)
    var bytes = [UInt8]()
    ([UInt8](string.utf8)).enumerated().forEach { item in
      bytes.append(item.element ^ cipher[item.offset % cipher.count])
    }
    return bytes
  }
}
