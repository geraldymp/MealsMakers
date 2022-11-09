//
//  File.swift
//  
//
//  Created by CODEXANB015 on 27/10/22.
//

import CoreOfMealsMaker

public struct MealTransformer: Mapper {
  public typealias Request = Any
  public typealias Response = [MealResponse]
  public typealias Entity = [MealModuleEntity]
  public typealias Domain = [MealDomainModel]
  
  public init() {}
  
  
  public func transformResponseToEntity(request: Any?, response: [MealResponse]) -> [MealModuleEntity] {
    return response.map { result in
      let newMeal = MealModuleEntity()
      newMeal.id = result.id ?? ""
      newMeal.name = result.name ?? "Unknown"
      newMeal.image = result.image ?? "Unknown"
      newMeal.desc = result.description ?? "Unknown"
      newMeal.category = result.category ?? ""
      newMeal.area = result.area ?? ""
      return newMeal
    }
  }
  
  public func transformEntityToDomain(entity: [MealModuleEntity]) -> [MealDomainModel] {
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
  
  public func transformDomainToEntity(domain: [MealDomainModel]) -> [MealModuleEntity] {
    let newMeal = MealModuleEntity()
    return [newMeal]
  }
}
