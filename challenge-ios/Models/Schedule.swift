//
//	Schedule.swift
//  challenge-ios
//
//	Create by Vladislav Ternovskiy on 7/5/2018
//	Copyright © 2018 Vladislav Ternovskiy. All rights reserved.
//

import Foundation 
import ObjectMapper


class Schedule : NSObject, NSCoding, Mappable {
  var currency : Currency?
  var eventDeadline : String?
  var eventStart : String?
  var id : Int?
  var price : Price?
  var servings : Int?
  var servingsSold : Int?
  
  class func newInstance(map: Map) -> Mappable?{
    return Schedule()
  }
  required init?(map: Map){}
  private override init(){}
  
  func mapping(map: Map) {
    currency <- map[ApiKey.currency]
    eventDeadline <- map[ApiKey.eventDeadline]
    eventStart <- map[ApiKey.eventStart]
    id <- map[ApiKey.id]
    price <- map[ApiKey.price]
    servings <- map[ApiKey.servings]
    servingsSold <- map[ApiKey.servingsSold]
    
  }
  
  /**
   * NSCoding required initializer.
   * Fills the data from the passed decoder
   */
  @objc required init(coder aDecoder: NSCoder) {
    currency = aDecoder.decodeObject(forKey: ApiKey.currency) as? Currency
    eventDeadline = aDecoder.decodeObject(forKey: ApiKey.eventDeadline) as? String
    eventStart = aDecoder.decodeObject(forKey: ApiKey.eventStart) as? String
    id = aDecoder.decodeObject(forKey: ApiKey.id) as? Int
    price = aDecoder.decodeObject(forKey: ApiKey.price) as? Price
    servings = aDecoder.decodeObject(forKey: ApiKey.servings) as? Int
    servingsSold = aDecoder.decodeObject(forKey: ApiKey.servingsSold) as? Int
    
  }
  
  /**
   * NSCoding required method.
   * Encodes mode properties into the decoder
   */
  @objc func encode(with aCoder: NSCoder) {
    if currency != nil{
      aCoder.encode(currency, forKey: ApiKey.currency)
    }
    if eventDeadline != nil{
      aCoder.encode(eventDeadline, forKey: ApiKey.eventDeadline)
    }
    if eventStart != nil{
      aCoder.encode(eventStart, forKey: ApiKey.eventStart)
    }
    if id != nil{
      aCoder.encode(id, forKey: ApiKey.id)
    }
    if price != nil{
      aCoder.encode(price, forKey: ApiKey.price)
    }
    if servings != nil{
      aCoder.encode(servings, forKey: ApiKey.servings)
    }
    if servingsSold != nil{
      aCoder.encode(servingsSold, forKey: ApiKey.servingsSold)
    }
    
  }
  
}
