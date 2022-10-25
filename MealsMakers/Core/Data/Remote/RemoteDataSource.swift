//
//  RemoteDataSource.swift
//  MealsMakers
//
//  Created by CODEXANB015 on 22/10/22.
//

import Foundation
import Alamofire
import Combine

protocol RemoteDataSourceProtocol: AnyObject {
  func getMeals() -> AnyPublisher<[MealResponse], Error>
}

final class RemoteDataSource: NSObject {
  
  private override init() { }
  
  static let sharedInstance: RemoteDataSource =  RemoteDataSource()
  
}

extension RemoteDataSource: RemoteDataSourceProtocol {
  
  func getMeals() -> AnyPublisher<[MealResponse], Error> {
    return Future<[MealResponse], Error> { completion in
      if let url = URL(string: Endpoints.Gets.meals.url) {
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
