//
//  File.swift
//  
//
//  Created by CODEXANB015 on 27/10/22.
//

import Foundation

public struct FavoriteDomainModel: Equatable, Identifiable {
  
  public let id: String
  public let name: String
  public let image: String
  public let description: String
  public let category: String
  public let area: String
  
  public init(id: String, name: String, image: String, description: String, category: String, area: String) {
    self.id = id
    self.name = name
    self.image = image
    self.description = description
    self.category = category
    self.area = area
  }
}
