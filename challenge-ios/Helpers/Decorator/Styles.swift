//
//  Styles.swift
//  Eaters
//
//  Created by Vladislav Ternovskiy on 11.03.2018.
//  Copyright © 2018 Vladislav Ternovskiy. All rights reserved.
//

import UIKit

struct Animation {
  
  static func setCellsAppearing() -> Decoration<UITableView> {
    return { (tableView: UITableView) in
      let cells = tableView.visibleCells
      let tableHeight: CGFloat = tableView.bounds.size.height
      for i in cells {
        let cell = i as UITableViewCell
        cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
      }
      var index = 0
      for a in cells {
        let cell = a as UITableViewCell
        UIView.animate(withDuration: 0.6, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .transitionFlipFromBottom, animations: {
          cell.transform = CGAffineTransform(translationX: 0, y: 0);
        }, completion: nil)
        index += 1
      }
    }
  }
  
  static func setAlpha(startValue: CGFloat, endValue: CGFloat, duration: Double = 0.3) -> Decoration<UIView> {
    return { (view: UIView) in
      view.alpha = startValue
      UIView.animate(withDuration: duration, animations: {
        view.alpha = endValue
      })
    }
  }
  
  static func rotateY3d() -> Decoration<UIView> {
    return { (view: UIView) in
      UIView.animate(withDuration: 0.3, animations: {
        view.transform = CATransform3DGetAffineTransform(CATransform3DMakeRotation(.pi, 0, 1, 0))
      }) { (completed) in
        UIView.animate(withDuration: 0.3, animations: {
          view.transform = CATransform3DGetAffineTransform(CATransform3DMakeRotation(.pi, 0, 0, 0))
        })
      }
    }
  }
}



struct Style {
  
  static func bottomGradient(with activityView: UIActivityIndicatorView,
                             maxYpos: CGFloat) -> Decoration<UIView> {
    return { (view: UIView) in
      let bottomFrame = CGRect(x: 0, y: maxYpos - 140, width: UIScreen.main.bounds.width, height: 100)
      let gradientBottomView = UIView(frame: bottomFrame)
      gradientBottomView.backgroundColor = .clear
      gradientBottomView.decorator.apply(Style.addGradient(topColor: UIColor.white.withAlphaComponent(0),
                                                            bottomColor: .white))
      
      
      activityView.frame = CGRect(x: bottomFrame.width / 2 - 30,
                                  y: bottomFrame.height / 2 - 42,
                                  width: 60,
                                  height: 60)
      activityView.color = .mainGreen
      activityView.hidesWhenStopped = true
      gradientBottomView.addSubview(activityView)
      activityView.startAnimating()
      view.addSubview(gradientBottomView)
    }
  }
  
  static func addGradient(topColor: UIColor, bottomColor: UIColor) -> Decoration<UIView> {
    return { (view: UIView) in
      let gl = CAGradientLayer()
      gl.frame = view.bounds
      let colorTop = topColor.cgColor
      let colorBottom = bottomColor.cgColor
      gl.colors = [colorTop, colorBottom]
      gl.locations = [0.0, 0.8]
      view.layer.insertSublayer(gl, at: 0)
    }
    
  }
  
  static func addGradientToCellBottom(topColor: UIColor, bottomColor: UIColor) -> Decoration<UIView> {
    return { (view: UIView) in
      let gl = CAGradientLayer()
      var frame = view.bounds
      frame.size = CGSize(width: UIScreen.main.bounds.width,
                          height: view.height)
      frame.origin = CGPoint(x: 0, y: frame.origin.y)
      gl.frame = frame
      let colorTop = topColor.cgColor
      let colorBottom = bottomColor.cgColor
      gl.colors = [colorTop, colorBottom]
      gl.locations = [0.0, 0.8]
      view.layer.insertSublayer(gl, at: 0)
    }
   
  }
  
  static func fontSizeToScreen() -> Decoration<UIButton> {
    return { (btn: UIButton) in
      if let titleLabel = btn.titleLabel {
        titleLabel.font = titleLabel.font.withSize(titleLabel.font.pointSize.toScreen())
      }
    }
  }
  
  static func fontSizeToScreen() -> Decoration<UILabel> {
    return { (label: UILabel) in
      label.font = label.font.withSize(label.font.pointSize.toScreen())
    }
  }
  
  static func setShadow(opacity: Float! = 0.4,
                        color: UIColor = .mainGreen,
                        offsetX: CGFloat = 0.0,
                        offsetY: CGFloat = 0.0,
                        cornerRadius: CGFloat = 0.0) -> Decoration<UIView> {
    return { (view: UIView) in
//      _ = view.subviews.map {
//        if $0.layer.cornerRadius == 0 {
//          $0.layer.cornerRadius = cornerRadius
//        }
//      }
      view.layer.shadowOpacity = opacity
      view.layer.shadowOffset = CGSize(width: offsetX, height: offsetY)
      view.layer.shadowRadius = 10
      view.layer.shadowColor = color.cgColor
      view.layer.cornerRadius = cornerRadius
    }
  }
  
  static func addParallax(withAmount amount: CGFloat!) -> Decoration<UIView> {
    return { (view: UIView) in
      let horizontal = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
      horizontal.minimumRelativeValue = -amount
      horizontal.maximumRelativeValue = amount
      let vertical = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
      vertical.minimumRelativeValue = -amount
      vertical.maximumRelativeValue = amount
      let group = UIMotionEffectGroup()
      group.motionEffects = [horizontal, vertical]
      view.addMotionEffect(group)
    }
  }
  
  static func setBarClear() -> Decoration<UINavigationBar> {
    return { (navBar: UINavigationBar) in
      navBar.setBackgroundImage(UIImage(), for: .default)
      navBar.shadowImage = UIImage()
      navBar.isTranslucent = true
      UIApplication.shared.statusBarStyle = .default
    }
  }
  
  static func addMultilineTitle(_ text: String) -> Decoration<UINavigationItem> {
    return { (item: UINavigationItem) in
      let label = UILabel(frame: CGRect(x: 0, y: 0, width: 440, height: 44))
      label.backgroundColor = .clear
      label.numberOfLines = 0
      label.textAlignment = .center
      label.font = UIFont.boldSystemFont(ofSize: 14.0)
      label.text = text
      label.textColor = .white
      item.titleView = label
    }
  }
}






