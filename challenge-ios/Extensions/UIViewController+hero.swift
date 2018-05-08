//
//  UIViewController+hero.swift
//  challenge-ios
//
//  Created by Vladislav Ternovskiy on 08.05.2018.
//  Copyright © 2018 Vladislav Ternovskiy. All rights reserved.
//

import Hero

extension UIViewController {
  
  func setHeroTransitionZoom(isBack: Bool!) {
    hero.isEnabled = true
    Hero.shared.defaultAnimation = isBack! ? .zoomOut : .zoom
    Hero.shared.containerColor = .white
  }
  
  func show(_ vc: UIViewController!) {
    setHeroTransitionZoom(isBack: false)
    if let viewController = vc {
      DispatchQueue.main.async {
        self.show(viewController, sender: nil)
      }
    }
  }
}
