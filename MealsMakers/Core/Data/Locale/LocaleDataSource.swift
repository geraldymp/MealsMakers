//
//  LocaleDataSource.swift
//  MealsMakers
//
//  Created by CODEXANB015 on 22/10/22.
//

import Foundation
import RealmSwift
import Combine

protocol LocaleDataSourceProtocol: AnyObject {
  func getMeals() -> AnyPublisher<[MealEntity], Error>
  func addMeals(from meals: [MealEntity]) -> AnyPublisher<Bool, Error>
  func addFavorites(from meal: FavoriteEntity) -> Void
}

final class LocaleDataSource: NSObject {
  
  private let realm: Realm?
  
  private init(realm: Realm?) {
    self.realm = realm
  }
  
  static let sharedInstance: (Realm?) -> LocaleDataSource = { realmDatabase in
    return LocaleDataSource(realm: realmDatabase)
  }
  
}

extension LocaleDataSource: LocaleDataSourceProtocol {
  
  func getMeals() -> AnyPublisher<[MealEntity], Error> {
    return Future<[MealEntity], Error> { completion in
      if let realm = self.realm {
        let meals: Results<MealEntity> = {
          realm.objects(MealEntity.self)
            .sorted(byKeyPath: "name", ascending: true)
        }()
        completion(.success(meals.toArray(ofType: MealEntity.self)))
      } else {
        completion(.failure(DatabaseError.invalidInstance))
      }
    }.eraseToAnyPublisher()
  }
  
  func addMeals(
    from meals: [MealEntity]
  ) -> AnyPublisher<Bool, Error> {
    return Future<Bool, Error> { completion in
      if let realm = self.realm {
        do {
          try realm.write {
            for meal in meals {
              realm.add(meal, update: .all)
            }
            completion(.success(true))
          }
        } catch {
          completion(.failure(DatabaseError.requestFailed))
        }
      } else {
        completion(.failure(DatabaseError.invalidInstance))
      }
    }.eraseToAnyPublisher()
  }
  
  func getFavorites() -> AnyPublisher<[FavoriteEntity], Error> {
    return Future<[FavoriteEntity], Error> { completion in
      if let realm = self.realm {
        let meals: Results<FavoriteEntity> = {
          realm.objects(FavoriteEntity.self)
        }()
        completion(.success(meals.toArray(ofType: FavoriteEntity.self)))
      } else {
        completion(.failure(DatabaseError.invalidInstance))
      }
    }.eraseToAnyPublisher()
  }
  
  func addFavorites(from meal: FavoriteEntity) {
    if let realm = self.realm {
      do {
        try realm.write {
          realm.add(meal, update: .all)
        }
      } catch {
        print("failed")
      }
    } else {
      print("total failed")
    }
  }
  
  func checkObjectExistence(from fav: FavoriteEntity) -> Bool {
    return realm?.object(ofType: FavoriteEntity.self, forPrimaryKey: fav.id) != nil
  }
  
  func deleteFavorites(of meal: FavoriteEntity) {
    if checkObjectExistence(from: meal) {
      do {
        try realm?.write{
          realm?.delete((realm?.object(ofType: FavoriteEntity.self, forPrimaryKey: meal.id))!)
        }
      } catch {
        print("Failed to delete")
      }
    } else {
      print("Nothing to delete")
    }
  }
}

extension Results {
  
  func toArray<T>(ofType: T.Type) -> [T] {
    var array = [T]()
    for index in 0 ..< count {
      if let result = self[index] as? T {
        array.append(result)
      }
    }
    return array
  }
  
}
