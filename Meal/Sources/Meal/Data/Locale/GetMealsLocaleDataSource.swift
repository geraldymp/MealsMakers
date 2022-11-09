//
//  File.swift
//  
//
//  Created by CODEXANB015 on 26/10/22.
//

import CoreOfMealsMaker
import Combine
import RealmSwift
import Foundation


// 1
public struct GetMealsLocaleDataSource: LocaleDataSource {
  
  // 2
  public typealias Request = Any
  public typealias Response = MealModuleEntity
  
  private let _realm: Realm
  
  public init(realm: Realm) {
    _realm = realm
  }
  
  // 3
  public func list(request: Any?) -> AnyPublisher<[MealModuleEntity], Error> {
    return Future<[MealModuleEntity], Error> { completion in
      let meals: Results<MealModuleEntity> = {
        _realm.objects(MealModuleEntity.self)
          .sorted(byKeyPath: "name", ascending: true)
      }()
      completion(.success(meals.toArray(ofType: MealModuleEntity.self)))
      
    }.eraseToAnyPublisher()
  }
  
  
  // 4
  public func add(entities: [MealModuleEntity]) -> AnyPublisher<Bool, Error> {
    return Future<Bool, Error> { completion in
      do {
        try _realm.write {
          for category in entities {
            _realm.add(category, update: .all)
          }
          completion(.success(true))
        }
      } catch {
        completion(.failure(DatabaseError.requestFailed))
      }
      
    }.eraseToAnyPublisher()
  }
  
  // 5
  public func get(id: String) -> AnyPublisher<MealModuleEntity, Error> {
    fatalError()
  }
  
  // 6
  public func update(id: Int, entity: MealModuleEntity) -> AnyPublisher<Bool, Error> {
    fatalError()
  }
  
  public func updateFav(domain: Request?) -> AnyPublisher<Bool, Error> {
    fatalError()
  }
  
  public func checkFavorite(domain: Request?) -> AnyPublisher<Bool, Error> {
    fatalError()
  }
}
