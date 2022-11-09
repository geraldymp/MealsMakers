//
//  File.swift
//  
//
//  Created by CODEXANB015 on 27/10/22.
//

import CoreOfMealsMaker
import Combine
import RealmSwift
import Foundation

public struct GetFavoritesLocaleDataSource: LocaleDataSource {
  
  public typealias Request = String
  public typealias Response = FavoriteModuleEntity
  
  private let _realm: Realm
  public init(realm: Realm) {
    _realm = realm
  }
  
  public func list(request: Request?) -> AnyPublisher<[FavoriteModuleEntity], Error> {
    return Future<[FavoriteModuleEntity], Error> { completion in
      let mealEntities = {
        _realm.objects(FavoriteModuleEntity.self)
      }()
      completion(.success(mealEntities.toArray(ofType: FavoriteModuleEntity.self)))
    }.eraseToAnyPublisher()
  }
  
  public func add(entities: [FavoriteModuleEntity]) -> AnyPublisher<Bool, Error> {
    fatalError()
  }
  
  public func updateFav(domain: String?) -> AnyPublisher<Bool, Error> {
    fatalError()
  }
  
  public func checkFavorite(domain: String?) -> AnyPublisher<Bool, Error> {
    fatalError()
  }
}
