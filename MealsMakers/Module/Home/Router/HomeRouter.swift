//
//  HomeRouter.swift
//  MealsMakers
//
//  Created by CODEXANB015 on 22/10/22.
//

import SwiftUI

class HomeRouter {
  
  func makeDetailView(for meal: MealModel) -> some View {
    let detailUseCase = Injection.init().provideDetail(meal: meal)
    let presenter = DetailPresenter(detailUseCase: detailUseCase, showFavoriteButton: true)
    return DetailView(presenter: presenter)
  }
  
  func makeFavoriteView() -> some View {
    let favoriteUseCase = Injection.init().provideFavorite()
    let presenter = FavoritePresenter(favoriteUseCase: favoriteUseCase)
    return FavoriteView(presenter: presenter)
  }

  func makeAboutView() -> some View {
    return AboutView()
  }
  
}
