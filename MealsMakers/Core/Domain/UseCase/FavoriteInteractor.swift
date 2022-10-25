//
//  File.swift
//  MealsMakers
//
//  Created by CODEXANB015 on 22/10/22.
//

import Foundation
import Combine

protocol FavoriteUseCase {
  func getFavorites() -> AnyPublisher<[MealModel], Error>
}

class FavoriteInteractor: FavoriteUseCase {
  private let repository: MealRepositoryProtocol
  
  required init(
    repository: MealRepositoryProtocol
  ) {
    self.repository = repository
  }
  
  func getFavorites() -> AnyPublisher<[MealModel], Error> {
    return repository.getFavorites()
  }
}
