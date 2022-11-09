//
//  File.swift
//  
//
//  Created by CODEXANB015 on 26/10/22.
//

import Foundation
import RealmSwift

public class MealModuleEntity: Object {
  
  @objc dynamic var id: String = ""
  @objc dynamic var name: String = ""
  @objc dynamic var image: String = ""
  @objc dynamic var desc: String = ""
  @objc dynamic var category: String = ""
  @objc dynamic var area: String = ""
  
  public override static func primaryKey() -> String? {
    return "id"
  }
}
