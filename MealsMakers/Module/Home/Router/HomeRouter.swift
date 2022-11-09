//
//  HomeRouter.swift
//  MealsMakers
//
//  Created by CODEXANB015 on 22/10/22.
//

import SwiftUI
import CoreOfMealsMaker
import Meal

class HomeRouter {

  func makeAboutView() -> some View {
    return AboutView()
  }
  
  func makeDetailView(for meal: MealDomainModel) -> some View {
    let useCase: Interactor<MealDomainModel, Bool, DetailRepository<DetailLocaleDataSource, FavoriteTransformer>> = Injection.init().provideDetail()
    let presenter = DetailPresenter(useCase: useCase)
    return DetailView(presenter: presenter, meal: meal)
  }
  
  func makeFavoriteView() -> some View {
    let useCase: Interactor<String, [MealDomainModel], GetFavoritesRepository<GetFavoritesLocaleDataSource, FavoriteTransformer>> = Injection.init().provideFavorite()
    let presenter = GetFavoritePresenter(useCase: useCase)
    return FavoriteView(presenter: presenter)
  }
  
}
