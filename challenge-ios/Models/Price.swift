//
//	Price.swift
//  challenge-ios
//
//	Create by Vladislav Ternovskiy on 7/5/2018
//	Copyright © 2018 Vladislav Ternovskiy. All rights reserved.
//

import Foundation 
import ObjectMapper

class Price: NSObject, NSCoding, Mappable {
  var amount : Int?
  var currency : Currency?
  
  class func newInstance(map: Map) -> Mappable? {
    return Price()
  }
  required init?(map: Map){}
  private override init(){}
  
  func mapping(map: Map) {
    amount <- map[ApiKey.amount]
    currency <- map[ApiKey.currency]
  }
  
  /**
   * NSCoding required initializer.
   * Fills the data from the passed decoder
   */
  @objc required init(coder aDecoder: NSCoder) {
    amount = aDecoder.decodeObject(forKey: ApiKey.amount) as? Int
    currency = aDecoder.decodeObject(forKey: ApiKey.currency) as? Currency
  }
  
  /**
   * NSCoding required method.
   * Encodes mode properties into the decoder
   */
  @objc func encode(with aCoder: NSCoder) {
    if amount != nil{
      aCoder.encode(amount, forKey: ApiKey.amount)
    }
    if currency != nil{
      aCoder.encode(currency, forKey: ApiKey.currency)
    }
  }
}
