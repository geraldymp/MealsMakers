//
//  MealEntity.swift
//  MealsMakers
//
//  Created by CODEXANB015 on 22/10/22.
//

import Foundation
import RealmSwift

class MealEntity: Object {
  
  @objc dynamic var id: String = ""
  @objc dynamic var name: String = ""
  @objc dynamic var image: String = ""
  @objc dynamic var desc: String = ""
  @objc dynamic var category: String = ""
  @objc dynamic var area: String = ""
  
  override static func primaryKey() -> String? {
    return "id"
  }
}
