//
//  APICall.swift
//  MealsMakers
//
//  Created by CODEXANB015 on 22/10/22.
//

import Foundation

struct API {
  static let baseUrl = "https://www.themealdb.com/api/json/v1/1/"
}

protocol Endpoint {
  var url: String { get }
}

enum Endpoints {
  
  enum Gets: Endpoint {
    case meals
    
    public var url: String {
      switch self {
        case .meals: return "\(API.baseUrl)search.php?f=m"
      }
    }
  }
  
}
