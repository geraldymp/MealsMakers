//
//  HomeInteractor.swift
//  MealsMakers
//
//  Created by CODEXANB015 on 22/10/22.
//

import Combine

protocol HomeUseCase {
  
  func getMeals() -> AnyPublisher<[MealModel], Error>
  
}

class HomeInteractor: HomeUseCase {
  
  private let repository: MealRepositoryProtocol
  
  required init(repository: MealRepositoryProtocol) {
    self.repository = repository
  }
  
  func getMeals() -> AnyPublisher<[MealModel], Error> {
    return repository.getMeals()
  }
  
}
