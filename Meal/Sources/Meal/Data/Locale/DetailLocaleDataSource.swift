//
//  File.swift
//  
//
//  Created by CODEXANB015 on 28/10/22.
//

import CoreOfMealsMaker
import Combine
import RealmSwift
import Foundation

public struct DetailLocaleDataSource: LocaleDataSource {
  
  public typealias Request = MealDomainModel
  public typealias Response = Bool
  
  private let _realm: Realm
  public init(realm: Realm) {
    _realm = realm
  }
  
  public func list(request: Request?) -> AnyPublisher<[Response], Error> {
    fatalError()
  }
  
  public func add(entities: [Response]) -> AnyPublisher<Bool, Error> {
    fatalError()
  }
  
  public func updateFav(domain: MealDomainModel?) -> AnyPublisher<Bool, Error> {
    let favEntity = DomainToEntity.mapMealDomainToFavEntity(input: domain!)
    if _realm.object(ofType: FavoriteModuleEntity.self, forPrimaryKey: favEntity.id) != nil {
      return deleteFavorite(entity: favEntity)
    } else {
      return addFavorite(entity: favEntity)
    }
  }
  
  private func addFavorite(entity: FavoriteModuleEntity?) -> AnyPublisher<Bool, Error> {
    return Future<Bool, Error> { completion in
      do {
        try _realm.write {
          _realm.add(entity!, update: .all)
        }
        completion(.success(true))
      }
      catch {
        completion(.failure(DatabaseError.requestFailed))
      }
    }.eraseToAnyPublisher()
  }
  
  private func deleteFavorite(entity: FavoriteModuleEntity?) -> AnyPublisher<Bool, Error> {
    return Future<Bool, Error> { completion in
      do {
        try _realm.write {
          _realm.delete((_realm.object(ofType: FavoriteModuleEntity.self, forPrimaryKey: entity?.id)!))
        }
        completion(.success(true))
      }
      catch {
        completion(.failure(DatabaseError.requestFailed))
      }
    }.eraseToAnyPublisher()
  }
  
  public func checkFavorite(domain: MealDomainModel?) -> AnyPublisher<Bool, Error> {
    let favEntity = DomainToEntity.mapMealDomainToFavEntity(input: domain!)
    return Future<Bool, Error> { completion in
      if _realm.object(ofType: FavoriteModuleEntity.self, forPrimaryKey: favEntity.id) != nil {
        completion(.success(true))
      }
    }
    .eraseToAnyPublisher()
  }
}
