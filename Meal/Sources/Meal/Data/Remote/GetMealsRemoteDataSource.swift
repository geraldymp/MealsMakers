//
//  File.swift
//  
//
//  Created by CODEXANB015 on 26/10/22.
//

import CoreOfMealsMaker
import Combine
import Alamofire
import Foundation

public struct GetMealsRemoteDataSource : DataSource {
  public typealias Request = Any
  
  public typealias Response = [MealResponse]
  
  private let _endpoint: String
  
  public init(endpoint: String) {
    _endpoint = endpoint
  }
  
  public func execute(request: Any?) -> AnyPublisher<[MealResponse], Error> {
    return Future<[MealResponse], Error> { completion in
      if let url = URL(string: _endpoint) {
        AF.request(url)
          .validate()
          .responseDecodable(of: MealsResponse.self) { response in
            switch response.result {
              case .success(let value):
                completion(.success(value.meals))
              case .failure:
                completion(.failure(URLError.invalidResponse))
            }
          }
      }
    }.eraseToAnyPublisher()
  }
}
