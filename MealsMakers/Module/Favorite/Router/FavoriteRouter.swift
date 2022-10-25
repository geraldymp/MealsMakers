//
//  FavoriteRouter.swift
//  MealsMakers
//
//  Created by CODEXANB015 on 22/10/22.
//

import SwiftUI

class FavoriteRouter {
  
  func makeDetailView(for meal: MealModel) -> some View {
    let detailUseCase = Injection.init().provideDetail(meal: meal)
    let presenter = DetailPresenter(detailUseCase: detailUseCase, showFavoriteButton: false)
    return DetailView(presenter: presenter)
  }

}
