//
//	EventsPagination.swift
//  challenge-ios
//
//	Create by Vladislav Ternovskiy on 7/5/2018
//	Copyright © 2018 Vladislav Ternovskiy. All rights reserved.
//

import Foundation 
import ObjectMapper

class EventsPagination: NSObject, NSCoding, Mappable {
  var data : EventsData?
  var error : AnyObject?
  
  class func newInstance(map: Map) -> Mappable? {
    return EventsPagination()
  }
  required init?(map: Map){}
  private override init(){}
  
  func mapping(map: Map) {
    data <- map[ApiKey.data]
    error <- map[ApiKey.error]
  }
  
  /**
   * NSCoding required initializer.
   * Fills the data from the passed decoder
   */
  @objc required init(coder aDecoder: NSCoder) {
    data = aDecoder.decodeObject(forKey: ApiKey.data) as? EventsData
    error = aDecoder.decodeObject(forKey: ApiKey.error) as? AnyObject
  }
  
  /**
   * NSCoding required method.
   * Encodes mode properties into the decoder
   */
  @objc func encode(with aCoder: NSCoder) {
    if data != nil{
      aCoder.encode(data, forKey: ApiKey.data)
    }
    if error != nil{
      aCoder.encode(error, forKey: ApiKey.error)
    }
    
  }
  
}
