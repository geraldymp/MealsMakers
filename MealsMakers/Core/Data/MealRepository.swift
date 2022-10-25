//
//  MealRepository.swift
//  MealsMakers
//
//  Created by CODEXANB015 on 22/10/22.
//

import Foundation
import Combine

protocol MealRepositoryProtocol {
  func getMeals() -> AnyPublisher<[MealModel], Error>
  func getFavorites() -> AnyPublisher<[MealModel], Error>
  func addFavorites(meal: MealModel) -> Void
  func checkIfFavorited(meal: MealModel) -> Bool
  func deleteFavorites(meal: MealModel) -> Void
}

final class MealRepository: NSObject {
  
  typealias MealInstance = (LocaleDataSource, RemoteDataSource) -> MealRepository
  
  fileprivate let remote: RemoteDataSource
  fileprivate let locale: LocaleDataSource
  
  private init(locale: LocaleDataSource, remote: RemoteDataSource) {
    self.locale = locale
    self.remote = remote
  }
  
  static let sharedInstance: MealInstance = { localeRepo, remoteRepo in
    return MealRepository(locale: localeRepo, remote: remoteRepo)
  }
  
}

extension MealRepository: MealRepositoryProtocol {
  func getMeals() -> AnyPublisher<[MealModel], Error> {
    return self.locale.getMeals()
      .flatMap { result -> AnyPublisher<[MealModel], Error> in
        if result.isEmpty {
          return self.remote.getMeals()
            .map { MealMapper.mapMealResponsesToEntities(input: $0) }
            .flatMap { self.locale.addMeals(from: $0) }
            .filter { $0 }
            .flatMap { _ in self.locale.getMeals()
                .map { MealMapper.mapMealEntitiesToDomains(input: $0) }
            }
            .eraseToAnyPublisher()
        } else {
          return self.locale.getMeals()
            .map { MealMapper.mapMealEntitiesToDomains(input: $0) }
            .eraseToAnyPublisher()
        }
      }.eraseToAnyPublisher()
    
  }
  
  func getFavorites() -> AnyPublisher<[MealModel], Error> {
    return self.locale.getFavorites()
      .map { MealMapper.mapFavEntitiesToDomains(input: $0) }
      .eraseToAnyPublisher()
  }
  
  func addFavorites(meal: MealModel) -> Void {
    self.locale.addFavorites(from: MealMapper.mapMealDomainToFavEntity(input: meal))
  }
  
  func checkIfFavorited(meal: MealModel) -> Bool {
    self.locale.checkObjectExistence(from: MealMapper.mapMealDomainToFavEntity(input: meal))
  }
  
  func deleteFavorites(meal: MealModel) -> Void {
    self.locale.deleteFavorites(of: MealMapper.mapMealDomainToFavEntity(input: meal))
  }
}
