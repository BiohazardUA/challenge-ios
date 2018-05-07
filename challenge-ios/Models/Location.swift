//
//	Location.swift
//  challenge-ios
//
//	Create by Vladislav Ternovskiy on 7/5/2018
//	Copyright © 2018 Vladislav Ternovskiy. All rights reserved.
//

import Foundation 
import ObjectMapper

class Location: NSObject, NSCoding, Mappable {
  var coordinates : [Float]?
  var type : String?
  
  class func newInstance(map: Map) -> Mappable?{
    return Location()
  }
  required init?(map: Map){}
  private override init(){}
  
  func mapping(map: Map) {
    coordinates <- map[ApiKey.coordinates]
    type <- map[ApiKey.type]
  }
  
  /**
   * NSCoding required initializer.
   * Fills the data from the passed decoder
   */
  @objc required init(coder aDecoder: NSCoder) {
    coordinates = aDecoder.decodeObject(forKey: ApiKey.coordinates) as? [Float]
    type = aDecoder.decodeObject(forKey: ApiKey.type) as? String
  }
  
  /**
   * NSCoding required method.
   * Encodes mode properties into the decoder
   */
  @objc func encode(with aCoder: NSCoder) {
    if coordinates != nil{
      aCoder.encode(coordinates, forKey: ApiKey.coordinates)
    }
    if type != nil{
      aCoder.encode(type, forKey: ApiKey.type)
    }
  }
}
