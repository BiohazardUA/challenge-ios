//
//	EventsData.swift
//  challenge-ios
//
//	Create by Vladislav Ternovskiy on 7/5/2018
//	Copyright © 2018 Vladislav Ternovskiy. All rights reserved.
//

import Foundation 
import ObjectMapper

class EventsData: NSObject, NSCoding, Mappable {
  var count : Int?
  var items : [EventItem]?
  
  class func newInstance(map: Map) -> Mappable? {
    return EventsData()
  }
  required init?(map: Map){}
  private override init(){}
  
  func mapping(map: Map) {
    count <- map[ApiKey.count]
    items <- map[ApiKey.items]
  }
  
  /**
   * NSCoding required initializer.
   * Fills the data from the passed decoder
   */
  @objc required init(coder aDecoder: NSCoder) {
    count = aDecoder.decodeObject(forKey: ApiKey.count) as? Int
    items = aDecoder.decodeObject(forKey: ApiKey.items) as? [EventItem]
  }
  
  /**
   * NSCoding required method.
   * Encodes mode properties into the decoder
   */
  @objc func encode(with aCoder: NSCoder) {
    if count != nil{
      aCoder.encode(count, forKey: ApiKey.count)
    }
    if items != nil{
      aCoder.encode(items, forKey: ApiKey.items)
    }
  }
}
