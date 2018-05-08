//
//  ServerAPI.swift
//  challenge-ios
//
//  Created by Vladislav Ternovskiy on 07.05.2018.
//  Copyright © 2018 Vladislav Ternovskiy. All rights reserved.
//

import Moya
import UIKit

enum ServerAPI {
  case fetchEvents(limit: Int, pageNumber: Int, cityID: String)
}

extension ServerAPI: TargetType {
  var baseURL: URL {
    return URL(string: "https://api.chef.one")!
  }
  
  var path: String {
    switch self {
    case .fetchEvents(let limit, let pageNumber, let cityID):
      if cityID.isEmpty {
        return "/events?pageSize=\(limit)&pageNumber=\(pageNumber)"
      } else {
        return "/events?pageSize=\(limit)&pageNumber=\(pageNumber)&cityId=\(cityID)"
      }
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .fetchEvents: return .get
    }
  }
  
  var parameters: [String: Any]? {
    return nil
  }
  
  var sampleData: Data {
    switch self {
    default: return Data()
    }
  }
  
  var task: Task {
    switch self.method {
    case .post, .put:
      return .requestParameters(parameters: parameters!,
                                encoding: JSONEncoding.default)
    default: return .requestPlain
    }
  }
  
  var headers: [String : String]? {
    return nil
  }
  
  var url: String {
    return "\(baseURL)\(path)"
  }
}

