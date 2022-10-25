//
//  DetailInteractor.swift
//  MealsMakers
//
//  Created by CODEXANB015 on 22/10/22.
//


import Foundation
import Combine

protocol DetailUseCase {
  
  func getMeal() -> MealModel
  func addFavorites(meal: MealModel) -> Void
  func checkIfFavorited(meal: MealModel) -> Bool
  func deleteFavorites(meal: MealModel) -> Void
}

class DetailInteractor: DetailUseCase {
  
  private let repository: MealRepositoryProtocol
  private let meal: MealModel
  
  required init(
    repository: MealRepositoryProtocol,
    meal: MealModel
  ) {
    self.repository = repository
    self.meal = meal
  }
  
  func getMeal() -> MealModel {
    return meal
  }
  
  func addFavorites(meal: MealModel) -> Void {
    repository.addFavorites(meal: meal)
  }
  
  func checkIfFavorited(meal: MealModel) -> Bool {
    repository.checkIfFavorited(meal: meal)
  }
  
  func deleteFavorites(meal: MealModel) -> Void {
    repository.deleteFavorites(meal: meal)
  }
}
