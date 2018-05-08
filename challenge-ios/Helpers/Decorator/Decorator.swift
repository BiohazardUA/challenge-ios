//
//  Decorator.swift
//  Eaters
//
//  Created by Vladislav Ternovskiy on 11.03.2018.
//  Copyright © 2018 Vladislav Ternovskiy. All rights reserved.
//

import UIKit

typealias Decoration<T> = (T) -> Void

struct Decorator<T> {
  let object: T
  
  func apply(_ decorations: Decoration<T>...) -> Void {
    decorations.forEach({ $0(object) })
  }
}

protocol DecoratorCompatible {
  associatedtype DecoratorCompatibleType
  var decorator: Decorator<DecoratorCompatibleType> { get }
}

extension DecoratorCompatible {
  var decorator: Decorator<Self> {
    return Decorator(object: self)
  }
}

extension UIView: DecoratorCompatible {}

extension UINavigationItem: DecoratorCompatible {}
