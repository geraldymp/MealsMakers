//
//  Injection.swift
//  MealsMakers
//
//  Created by CODEXANB015 on 22/10/22.
//

import Foundation
import RealmSwift

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
  
  func provideDetail(meal: MealModel) -> DetailUseCase {
    let repository = provideRepository()
    return DetailInteractor(repository: repository, meal: meal)
  }
  
  func provideFavorite() -> FavoriteUseCase {
    let repository = provideRepository()
    return FavoriteInteractor(repository: repository)
  }
  
}
