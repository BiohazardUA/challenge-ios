//
//	City.swift
//  challenge-ios
//
//	Create by Vladislav Ternovskiy on 7/5/2018
//	Copyright © 2018 Vladislav Ternovskiy. All rights reserved.
//

import Foundation 
import ObjectMapper

class City : NSObject, NSCoding, Mappable{
  var id : String?
  var countryName : String?
  var createdAt : String?
  var imageUrl : String?
  var isActive : Bool?
  var isEmpty : Bool?
  var location : Location?
  var name : String?
  var updatedAt : String?
  
  class func newInstance(map: Map) -> Mappable? {
    return City()
  }
  required init?(map: Map){}
  private override init(){}
  
  func mapping(map: Map) {
    id <- map[ApiKey.id]
    countryName <- map[ApiKey.countryName]
    createdAt <- map[ApiKey.createdAt]
    imageUrl <- map[ApiKey.imageUrl]
    isActive <- map[ApiKey.isActive]
    isEmpty <- map[ApiKey.isEmpty]
    location <- map[ApiKey.location]
    name <- map[ApiKey.name]
    updatedAt <- map[ApiKey.updatedAt]
  }
  
  /**
   * NSCoding required initializer.
   * Fills the data from the passed decoder
   */
  @objc required init(coder aDecoder: NSCoder) {
    id = aDecoder.decodeObject(forKey: ApiKey.id) as? String
    countryName = aDecoder.decodeObject(forKey: ApiKey.countryName) as? String
    createdAt = aDecoder.decodeObject(forKey: ApiKey.createdAt) as? String
    imageUrl = aDecoder.decodeObject(forKey: ApiKey.imageUrl) as? String
    isActive = aDecoder.decodeObject(forKey: ApiKey.isActive) as? Bool
    isEmpty = aDecoder.decodeObject(forKey: ApiKey.isEmpty) as? Bool
    location = aDecoder.decodeObject(forKey: ApiKey.location) as? Location
    name = aDecoder.decodeObject(forKey: ApiKey.name) as? String
    updatedAt = aDecoder.decodeObject(forKey: ApiKey.updatedAt) as? String
    
  }
  
  /**
   * NSCoding required method.
   * Encodes mode properties into the decoder
   */
  @objc func encode(with aCoder: NSCoder) {
    if id != nil{
      aCoder.encode(id, forKey: ApiKey.id)
    }
    if countryName != nil{
      aCoder.encode(countryName, forKey: ApiKey.countryName)
    }
    if createdAt != nil{
      aCoder.encode(createdAt, forKey: ApiKey.createdAt)
    }
    if imageUrl != nil{
      aCoder.encode(imageUrl, forKey: ApiKey.imageUrl)
    }
    if isActive != nil{
      aCoder.encode(isActive, forKey: ApiKey.isActive)
    }
    if isEmpty != nil{
      aCoder.encode(isEmpty, forKey: ApiKey.isEmpty)
    }
    if location != nil{
      aCoder.encode(location, forKey: ApiKey.location)
    }
    if name != nil{
      aCoder.encode(name, forKey: ApiKey.name)
    }
    if updatedAt != nil{
      aCoder.encode(updatedAt, forKey: ApiKey.updatedAt)
    }
    
  }
  
}
