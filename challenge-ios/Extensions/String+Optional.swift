//
//  String+Optional.swift
//  challenge-ios
//
//  Created by Vladislav Ternovskiy on 06.07.2018.
//  Copyright © 2018 Vladislav Ternovskiy. All rights reserved.
//

import Foundation

extension Optional where Wrapped == String {
  
  var orEmpty: String {
    return self ?? String()
  }
  
  var isBlank: Bool {
    return self?.isEmpty ?? true
  }
}
