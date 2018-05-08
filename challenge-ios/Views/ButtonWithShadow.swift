//
//  ButtonWithShadow.swift
//  Eaters
//
//  Created by Vladislav Ternovskiy on 11.03.2018.
//  Copyright © 2018 Vladislav Ternovskiy. All rights reserved.
//

import UIKit

@IBDesignable
class ButtonWithShadow: UIButton {
  @IBInspectable var radiusOfCorners: CGFloat = 5 { didSet { createShadow() } }
  @IBInspectable var shadowEnabled: Bool = false {
    didSet {
      if shadowEnabled {
        createShadow()
      }
    }
  }
  
  func createShadow() {
    decorator.apply(Style.setShadow(opacity: shadowOpacity,
                                     color: shadowColor ?? .mainGreen,
                                     offsetX: shadowOffset.width,
                                     offsetY: shadowOffset.height,
                                     cornerRadius: radiusOfCorners))
  }
}
