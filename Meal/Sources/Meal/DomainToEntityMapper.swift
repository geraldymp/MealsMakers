//
//  File.swift
//  
//
//  Created by CODEXANB015 on 28/10/22.
//

import CoreOfMealsMaker

final class DomainToEntity {
  static func mapMealDomainToFavEntity(
    input mealDomain: MealDomainModel) -> FavoriteModuleEntity {
      let newFav = FavoriteModuleEntity()
      newFav.id = mealDomain.id
      newFav.name = mealDomain.name
      newFav.image = mealDomain.image
      newFav.desc = mealDomain.description
      newFav.category = mealDomain.category
      newFav.area = mealDomain.area
      return newFav
    }

}
