//
//	Chef.swift
//  challenge-ios
//
//	Create by Vladislav Ternovskiy on 7/5/2018
//	Copyright © 2018 Vladislav Ternovskiy. All rights reserved.
//

import Foundation 
import ObjectMapper

class Chef: NSObject, NSCoding, Mappable {
  var avatarUrl : String?
  var firstName : String?
  var id : String?
  var reviewsAverageRate : Int?
  var reviewsCount : Int?
  
  class func newInstance(map: Map) -> Mappable? {
    return Chef()
  }
  required init?(map: Map){}
  private override init(){}
  
  func mapping(map: Map) {
    avatarUrl <- map[ApiKey.avatarUrl]
    firstName <- map[ApiKey.firstName]
    id <- map[ApiKey.id]
    reviewsAverageRate <- map[ApiKey.reviewsAverageRate]
    reviewsCount <- map[ApiKey.reviewsCount]
  }
  
  /**
   * NSCoding required initializer.
   * Fills the data from the passed decoder
   */
  @objc required init(coder aDecoder: NSCoder) {
    avatarUrl = aDecoder.decodeObject(forKey: ApiKey.avatarUrl) as? String
    firstName = aDecoder.decodeObject(forKey: ApiKey.firstName) as? String
    id = aDecoder.decodeObject(forKey: ApiKey.id) as? String
    reviewsAverageRate = aDecoder.decodeObject(forKey: ApiKey.reviewsAverageRate) as? Int
    reviewsCount = aDecoder.decodeObject(forKey: ApiKey.reviewsCount) as? Int
    
  }
  
  /**
   * NSCoding required method.
   * Encodes mode properties into the decoder
   */
  @objc func encode(with aCoder: NSCoder) {
    if avatarUrl != nil{
      aCoder.encode(avatarUrl, forKey: ApiKey.avatarUrl)
    }
    if firstName != nil{
      aCoder.encode(firstName, forKey: ApiKey.firstName)
    }
    if id != nil{
      aCoder.encode(id, forKey: ApiKey.id)
    }
    if reviewsAverageRate != nil{
      aCoder.encode(reviewsAverageRate, forKey: ApiKey.reviewsAverageRate)
    }
    if reviewsCount != nil{
      aCoder.encode(reviewsCount, forKey: ApiKey.reviewsCount)
    }
  }
}
