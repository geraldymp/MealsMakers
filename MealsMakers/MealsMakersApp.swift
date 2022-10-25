//
//  MealsMakersApp.swift
//  MealsMakers
//
//  Created by CODEXANB015 on 22/10/22.
//

import SwiftUI

@main
struct MealsMakersApp: App {
    var body: some Scene {
      let homeUseCase = Injection.init().provideHome()
      let favoriteUseCase = Injection.init().provideFavorite()
      
      let homePresenter = HomePresenter(homeUseCase: homeUseCase)
      let favoritePresenter = FavoritePresenter(favoriteUseCase: favoriteUseCase)
        WindowGroup {
            ContentView()
            .environmentObject(homePresenter)
            .environmentObject(favoritePresenter)
        }
    }
}
