//
//  ScreensMultiplier.swift
//  Eaters
//
//  Created by Vladislav Ternovskiy on 11.03.2018.
//  Copyright © 2018 Vladislav Ternovskiy. All rights reserved.
//

import Foundation
import SDVersion
import UIKit

//Default screen size in the app is 5,5'

class ScreensMultiplier {
  
  class func multiplierValue(_ value:Float) -> Float {
    switch UIDevice.current.userInterfaceIdiom {
    case .pad:
      return value * 1.4
    default:
      switch SDiOSVersion.deviceSize() {
      case .Screen3Dot5inch, .Screen4inch:
        return value * 0.75
      case .Screen4Dot7inch:
        return value * 0.85
      case .Screen5Dot5inch:
        return value
      case .Screen5Dot8inch:
        return value * 0.95
      default:
        return value
      }
    }
  }
}

extension Float {
  
  func toScreen() -> Float {
    return ScreensMultiplier.multiplierValue(self)
  }
  
}

extension Double {
  
  func toScreen() -> Double {
    return Double(ScreensMultiplier.multiplierValue(Float(self)))
  }
  
}

extension CGFloat {
  
  func toScreen() -> CGFloat {
    return CGFloat(ScreensMultiplier.multiplierValue(Float(self)))
  }
  
}
