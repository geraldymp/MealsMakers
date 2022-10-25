//
//  MealModel.swift
//  MealsMakers
//
//  Created by CODEXANB015 on 22/10/22.
//

import Foundation

struct MealModel: Equatable, Identifiable {
  
  let id: String
  let name: String
  let image: String
  let description: String
  let category: String
  let area: String
}
