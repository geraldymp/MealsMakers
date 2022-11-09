//
//  FavoriteRouter.swift
//  MealsMakers
//
//  Created by CODEXANB015 on 22/10/22.
//

import SwiftUI
import Meal
import CoreOfMealsMaker

class FavoriteRouter {
  
  func makeDetailView(for meal: MealDomainModel) -> some View {
    let useCase: Interactor<MealDomainModel, Bool, DetailRepository<DetailLocaleDataSource, FavoriteTransformer>> = Injection.init().provideDetail()
    let presenter = DetailPresenter(useCase: useCase)
    return DetailView(presenter: presenter, meal: meal)
  }

}
