//
//  DateHelper.swift
//  challenge-ios
//
//  Created by Vladislav Ternovskiy on 08.05.2018.
//  Copyright © 2018 Vladislav Ternovskiy. All rights reserved.
//

import Foundation

class DateHelper {
  private init() {}
  
  static func dateFrom(_ string: String?) -> Date? {
    guard string != nil else { return nil }
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sssZ"
    let date = dateFormatter.date(from: string!)
    return date
  }
  
  static func format(_ date: Date?) -> String? {
    guard date != nil else { return nil }
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "E dd, MMM yyyy"
    dateFormatter.timeZone = .autoupdatingCurrent
    dateFormatter.locale = .autoupdatingCurrent
    
    return dateFormatter.string(from: date!)
  }
}
