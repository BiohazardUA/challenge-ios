//
//	Image.swift
//  challenge-ios
//
//	Create by Vladislav Ternovskiy on 7/5/2018
//	Copyright © 2018 Vladislav Ternovskiy. All rights reserved.
//

import Foundation 
import ObjectMapper

class ImageItem: NSObject, NSCoding, Mappable {
  var createdAt : String?
  var eventId : String?
  var id : Int?
  var imageUrl : String?
  var title : String?
  var updatedAt : String?
  
  class func newInstance(map: Map) -> Mappable? {
    return ImageItem()
  }
  required init?(map: Map){}
  private override init(){}
  
  func mapping(map: Map) {
    createdAt <- map[ApiKey.createdAt]
    eventId <- map[ApiKey.eventId]
    id <- map[ApiKey.id]
    imageUrl <- map[ApiKey.imageUrl]
    title <- map[ApiKey.title]
    updatedAt <- map[ApiKey.updatedAt]
    
  }
  
  /**
   * NSCoding required initializer.
   * Fills the data from the passed decoder
   */
  @objc required init(coder aDecoder: NSCoder) {
    createdAt = aDecoder.decodeObject(forKey: ApiKey.createdAt) as? String
    eventId = aDecoder.decodeObject(forKey: ApiKey.eventId) as? String
    id = aDecoder.decodeObject(forKey: ApiKey.id) as? Int
    imageUrl = aDecoder.decodeObject(forKey: ApiKey.imageUrl) as? String
    title = aDecoder.decodeObject(forKey: ApiKey.title) as? String
    updatedAt = aDecoder.decodeObject(forKey: ApiKey.updatedAt) as? String
    
  }
  
  /**
   * NSCoding required method.
   * Encodes mode properties into the decoder
   */
  @objc func encode(with aCoder: NSCoder) {
    if createdAt != nil{
      aCoder.encode(createdAt, forKey: ApiKey.createdAt)
    }
    if eventId != nil{
      aCoder.encode(eventId, forKey: ApiKey.eventId)
    }
    if id != nil{
      aCoder.encode(id, forKey: ApiKey.id)
    }
    if imageUrl != nil{
      aCoder.encode(imageUrl, forKey: ApiKey.imageUrl)
    }
    if title != nil{
      aCoder.encode(title, forKey: ApiKey.title)
    }
    if updatedAt != nil{
      aCoder.encode(updatedAt, forKey: ApiKey.updatedAt)
    }
  }
}
