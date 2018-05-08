//
//  NavController.swift
//  challenge-ios
//
//  Created by Vladislav Ternovskiy on 08.05.2018.
//  Copyright © 2018 Vladislav Ternovskiy. All rights reserved.
//

import SwifterSwift

class NavController: UINavigationController, UIGestureRecognizerDelegate {
  
  override func awakeFromNib() {
    super.awakeFromNib()
//    hero.isEnabled = false
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.backBarButtonItem?.tintColor = .white
    navigationBar.setTitleFont(UIFont.systemFont(ofSize: 17),
                               color: .white)
    navigationBar.barTintColor = .mainGreen
    interactivePopGestureRecognizer?.delegate = self
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
    return viewControllers.count > 1
  }
}
