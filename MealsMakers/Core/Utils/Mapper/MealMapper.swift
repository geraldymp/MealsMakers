//
//  MealMapper.swift
//  MealsMakers
//
//  Created by CODEXANB015 on 22/10/22.
//

final class MealMapper {
  
  static func mapMealResponsesToEntities(
    input mealResponses: [MealResponse]
  ) -> [MealEntity] {
    return mealResponses.map { result in
      let newMeal = MealEntity()
      newMeal.id = result.id ?? ""
      newMeal.name = result.name ?? ""
      newMeal.image = result.image ?? ""
      newMeal.desc = result.description ?? ""
      newMeal.category = result.category ?? ""
      newMeal.area = result.area ?? ""
      return newMeal
    }
  }
  
  static func mapMealEntitiesToDomains(
    input mealEntities: [MealEntity]
  ) -> [MealModel] {
    return mealEntities.map { result in
      return MealModel(
        id: result.id,
        name: result.name,
        image: result.image,
        description: result.desc,
        category: result.category,
        area: result.area
      )
    }
  }
  
  static func mapMealResponsesToDomains(
    input mealResponses: [MealResponse]
  ) -> [MealModel] {
    return mealResponses.map { result in
      return MealModel(
        id: result.id ?? "",
        name: result.name ?? "",
        image: result.image ?? "",
        description: result.description ?? "",
        category: result.category ?? "",
        area: result.area ?? ""
      )
    }
  }
  
  static func mapFavEntitiesToDomains(
    input favEntities: [FavoriteEntity]
  ) -> [MealModel] {
    return favEntities.map { result in
      return MealModel(
        id: result.id,
        name: result.name,
        image: result.image,
        description: result.desc,
        category: result.category,
        area: result.area
      )
    }
  }
  
  static func mapMealDomainToFavEntity(
    input mealDomain: MealModel) -> FavoriteEntity {
      let newFav = FavoriteEntity()
      newFav.id = mealDomain.id
      newFav.name = mealDomain.name
      newFav.image = mealDomain.image
      newFav.desc = mealDomain.description
      newFav.category = mealDomain.category
      newFav.area = mealDomain.area
      return newFav
    }
  
}
