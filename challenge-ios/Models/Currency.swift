//
//	Currency.swift
//  challenge-ios
//
//	Create by Vladislav Ternovskiy on 7/5/2018
//	Copyright © 2018 Vladislav Ternovskiy. All rights reserved.
//

import Foundation 
import ObjectMapper

class Currency: NSObject, NSCoding, Mappable {
  var code : String?
  var id : String?
  var name : String?
  var symbol : String?
  
  class func newInstance(map: Map) -> Mappable? {
    return Currency()
  }
  required init?(map: Map){}
  private override init(){}
  
  func mapping(map: Map) {
    code <- map[ApiKey.code]
    id <- map[ApiKey.id]
    name <- map[ApiKey.name]
    symbol <- map[ApiKey.symbol]
  }
  
  /**
   * NSCoding required initializer.
   * Fills the data from the passed decoder
   */
  @objc required init(coder aDecoder: NSCoder) {
    code = aDecoder.decodeObject(forKey: ApiKey.code) as? String
    id = aDecoder.decodeObject(forKey: ApiKey.id) as? String
    name = aDecoder.decodeObject(forKey: ApiKey.name) as? String
    symbol = aDecoder.decodeObject(forKey: ApiKey.symbol) as? String
    
  }
  
  /**
   * NSCoding required method.
   * Encodes mode properties into the decoder
   */
  @objc func encode(with aCoder: NSCoder) {
    if code != nil{
      aCoder.encode(code, forKey: ApiKey.code)
    }
    if id != nil{
      aCoder.encode(id, forKey: ApiKey.id)
    }
    if name != nil{
      aCoder.encode(name, forKey: ApiKey.name)
    }
    if symbol != nil{
      aCoder.encode(symbol, forKey: ApiKey.symbol)
    }
    
  }
  
}
