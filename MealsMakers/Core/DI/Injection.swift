//
//  Injection.swift
//  MealsMakers
//
//  Created by CODEXANB015 on 22/10/22.
//

import Foundation
import RealmSwift
import CoreOfMealsMaker
import Meal
import UIKit

final class Injection: NSObject {
  
  private func provideRepository() -> MealRepositoryProtocol {
    let realm = try? Realm()
    
    let locale: LocaleDataSource = LocaleDataSource.sharedInstance(realm)
    let remote: RemoteDataSource = RemoteDataSource.sharedInstance
    
    return MealRepository.sharedInstance(locale, remote)
  }
  
  func provideHome() -> HomeUseCase {
    let repository = provideRepository()
    return HomeInteractor(repository: repository)
  }
  
  func provideMeal<U: UseCase>() -> U where U.Request == Any, U.Response == [MealDomainModel] {
    let realm = try? Realm()
    let locale = GetMealsLocaleDataSource(realm: realm!)
    let remote = GetMealsRemoteDataSource(endpoint: Endpoints.Gets.meals.url)
    let mapper = MealTransformer()
    let repository = GetMealsRepository(
      localeDataSource: locale,
      remoteDataSource: remote,
      mapper: mapper
    )
    return Interactor(repository: repository) as! U
  }
  
  func provideFavorite<U: UseCase>() -> U where U.Request == String, U.Response == [MealDomainModel] {
    let realm = try? Realm()
    let locale = GetFavoritesLocaleDataSource(realm: realm!)
    let mapper = FavoriteTransformer()
    let repository = GetFavoritesRepository(
      localeDataSource: locale,
      mapper: mapper
    )
    return Interactor(repository: repository) as! U
  }
  
  func provideDetail<U: UseCase>() -> U where U.Request == MealDomainModel, U.Response == Bool {
    let realm = try? Realm()
    let locale = DetailLocaleDataSource(realm: realm!)
    let mapper = FavoriteTransformer()
    let repository = DetailRepository(localeDataSource: locale, mapper: mapper)
    return Interactor(repository: repository) as! U
  }
  
}
