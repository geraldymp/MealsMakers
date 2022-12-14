//
//  MealsResponse.swift
//  MealsMakers
//
//  Created by CODEXANB015 on 22/10/22.
//

import Foundation

struct MealsResponse: Decodable {
  
  let meals: [MealResponse]
  
}

struct MealResponse: Decodable {
  
  private enum CodingKeys: String, CodingKey {
    case id = "idMeal"
    case name = "strMeal"
    case image = "strMealThumb"
    case description = "strInstructions"
    case category = "strCategory"
    case area = "strArea"
  }
  
  let id: String?
  let name: String?
  let image: String?
  let description: String?
  let category: String?
  let area: String?
  
}
