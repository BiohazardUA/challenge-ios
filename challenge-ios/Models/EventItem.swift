//
//	EventItem.swift
//  challenge-ios
//
//	Create by Vladislav Ternovskiy on 7/5/2018
//	Copyright © 2018 Vladislav Ternovskiy. All rights reserved.
//

import Foundation 
import ObjectMapper

class EventItem: NSObject, NSCoding, Mappable {
  var address : String?
  var chef : Chef?
  var chefExplanation : String?
  var city : City?
  var createdAt : String?
  var descriptionField : String?
  var id : String?
  var images : [ImageItem]?
  var location : Location?
  var rejectionText : String?
  var reviewsAverageRate : String?
  var reviewsCount : Int?
  var schedules : [Schedule]?
  var status : String?
  var tags : [AnyObject]?
  var title : String?
  var updatedAt : String?
  
  class func newInstance(map: Map) -> Mappable?{
    return EventItem()
  }
  required init?(map: Map){}
  private override init(){}
  
  func mapping(map: Map) {
    address <- map[ApiKey.address]
    chef <- map[ApiKey.chef]
    chefExplanation <- map[ApiKey.chefExplanation]
    city <- map[ApiKey.city]
    createdAt <- map[ApiKey.createdAt]
    descriptionField <- map[ApiKey.description]
    id <- map[ApiKey.id]
    images <- map[ApiKey.images]
    location <- map[ApiKey.location]
    rejectionText <- map[ApiKey.rejectionText]
    reviewsAverageRate <- map[ApiKey.reviewsAverageRate]
    reviewsCount <- map[ApiKey.reviewsCount]
    schedules <- map[ApiKey.schedules]
    status <- map[ApiKey.status]
    tags <- map[ApiKey.tags]
    title <- map[ApiKey.title]
    updatedAt <- map[ApiKey.updatedAt]
  }
  
  /**
   * NSCoding required initializer.
   * Fills the data from the passed decoder
   */
  @objc required init(coder aDecoder: NSCoder) {
    address = aDecoder.decodeObject(forKey: ApiKey.address) as? String
    chef = aDecoder.decodeObject(forKey: ApiKey.chef) as? Chef
    chefExplanation = aDecoder.decodeObject(forKey: ApiKey.chefExplanation) as? String
    city = aDecoder.decodeObject(forKey: ApiKey.city) as? City
    createdAt = aDecoder.decodeObject(forKey: ApiKey.createdAt) as? String
    descriptionField = aDecoder.decodeObject(forKey: ApiKey.description) as? String
    id = aDecoder.decodeObject(forKey: ApiKey.id) as? String
    images = aDecoder.decodeObject(forKey: ApiKey.images) as? [ImageItem]
    location = aDecoder.decodeObject(forKey: ApiKey.location) as? Location
    rejectionText = aDecoder.decodeObject(forKey: ApiKey.rejectionText) as? String
    reviewsAverageRate = aDecoder.decodeObject(forKey: ApiKey.reviewsAverageRate) as? String
    reviewsCount = aDecoder.decodeObject(forKey: ApiKey.reviewsCount) as? Int
    schedules = aDecoder.decodeObject(forKey: ApiKey.schedules) as? [Schedule]
    status = aDecoder.decodeObject(forKey: ApiKey.status) as? String
    tags = aDecoder.decodeObject(forKey: ApiKey.tags) as? [AnyObject]
    title = aDecoder.decodeObject(forKey: ApiKey.title) as? String
    updatedAt = aDecoder.decodeObject(forKey: ApiKey.updatedAt) as? String
  }
  
  /**
   * NSCoding required method.
   * Encodes mode properties into the decoder
   */
  @objc func encode(with aCoder: NSCoder) {
    if address != nil{
      aCoder.encode(address, forKey: ApiKey.address)
    }
    if chef != nil{
      aCoder.encode(chef, forKey: ApiKey.chef)
    }
    if chefExplanation != nil{
      aCoder.encode(chefExplanation, forKey: ApiKey.chefExplanation)
    }
    if city != nil{
      aCoder.encode(city, forKey: ApiKey.city)
    }
    if createdAt != nil{
      aCoder.encode(createdAt, forKey: ApiKey.createdAt)
    }
    if descriptionField != nil{
      aCoder.encode(descriptionField, forKey: ApiKey.description)
    }
    if id != nil{
      aCoder.encode(id, forKey: ApiKey.id)
    }
    if images != nil{
      aCoder.encode(images, forKey: ApiKey.images)
    }
    if location != nil{
      aCoder.encode(location, forKey: ApiKey.location)
    }
    if rejectionText != nil{
      aCoder.encode(rejectionText, forKey: ApiKey.rejectionText)
    }
    if reviewsAverageRate != nil{
      aCoder.encode(reviewsAverageRate, forKey: ApiKey.reviewsAverageRate)
    }
    if reviewsCount != nil{
      aCoder.encode(reviewsCount, forKey: ApiKey.reviewsCount)
    }
    if schedules != nil{
      aCoder.encode(schedules, forKey: ApiKey.schedules)
    }
    if status != nil{
      aCoder.encode(status, forKey: ApiKey.status)
    }
    if tags != nil{
      aCoder.encode(tags, forKey: ApiKey.tags)
    }
    if title != nil{
      aCoder.encode(title, forKey: ApiKey.title)
    }
    if updatedAt != nil{
      aCoder.encode(updatedAt, forKey: ApiKey.updatedAt)
    }
  }
}
