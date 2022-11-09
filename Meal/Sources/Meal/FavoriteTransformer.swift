//
//  File.swift
//  
//
//  Created by CODEXANB015 on 27/10/22.
//

import CoreOfMealsMaker

public struct FavoriteTransformer: Mapper {
  public typealias Request = String
  public typealias Response = [MealResponse]
  public typealias Entity = [FavoriteModuleEntity]
  public typealias Domain = [MealDomainModel]
  public typealias SingleDomain = MealDomainModel
  public typealias SingleEntity = FavoriteModuleEntity
  
  public init() {}
  
  
  public func transformResponseToEntity(request: String?, response: [MealResponse]) -> [FavoriteModuleEntity] {
    return response.map { result in
      let newMeal = FavoriteModuleEntity()
      newMeal.id = result.id ?? ""
      newMeal.name = result.name ?? "Unknown"
      newMeal.image = result.image ?? "Unknown"
      newMeal.desc = result.description ?? "Unknown"
      newMeal.category = result.category ?? ""
      newMeal.area = result.area ?? ""
      return newMeal
    }
  }
  
  public func transformEntityToDomain(entity: [FavoriteModuleEntity]) -> [MealDomainModel] {
    return entity.map { result in
      return MealDomainModel(
        id: result.id,
        name: result.name,
        image: result.image,
        description: result.desc,
        category: result.category,
        area: result.area
      )
    }
  }
  
  public func transformDomainToEntity(domain: MealDomainModel) -> FavoriteModuleEntity {
    let newFav = FavoriteModuleEntity()
    newFav.id = domain.id
    newFav.name = domain.name
    newFav.image = domain.image
    newFav.desc = domain.description
    newFav.category = domain.category
    newFav.area = domain.area
    return newFav
  }
}
