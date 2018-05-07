//
//  LoadingState.swift
//  challenge-ios
//
//  Created by Vladislav Ternovskiy on 07.05.2018.
//  Copyright © 2018 Vladislav Ternovskiy. All rights reserved.
//

import Foundation

// MARK: - Enum Values
enum LoadingState: Equatable {
  /// Content is available and not loading any content
  case normal
  /// No Content is available
  case empty
  /// Got an error loading content
  case error
  /// Is loading content
  case loading
}

// MARK: - Equatable
func == (lhs: LoadingState, rhs: LoadingState) -> Bool {
  switch (lhs, rhs) {
  case (.normal, .normal):
    return true
  case (.empty, .empty):
    return true
  case (.error, .error):
    return true
  case (.loading, .loading):
    return true
  default:
    return false
  }
}
