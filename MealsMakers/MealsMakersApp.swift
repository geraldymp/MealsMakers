//
//  MealsMakersApp.swift
//  MealsMakers
//
//  Created by CODEXANB015 on 22/10/22.
//

import SwiftUI
import CoreOfMealsMaker
import Meal

@main
struct MealsMakersApp: App {
    var body: some Scene {
      
      let favoriteUseCase: Interactor<String, [MealDomainModel], GetFavoritesRepository< GetFavoritesLocaleDataSource, FavoriteTransformer>> = Injection.init().provideFavorite()
      
      let mealUseCase: Interactor<
        Any,
        [MealDomainModel],
        GetMealsRepository<
          GetMealsLocaleDataSource,
          GetMealsRemoteDataSource,
          MealTransformer>
      > = Injection.init().provideMeal()
      
      let homePresenter = GetListPresenter(useCase: mealUseCase)
      let favoritePresenter = GetFavoritePresenter(useCase: favoriteUseCase)
        WindowGroup {
            ContentView()
            .environmentObject(homePresenter)
            .environmentObject(favoritePresenter)
        }
    }
}
