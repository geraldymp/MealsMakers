//
//  DetailPresenter.swift
//  MealsMakers
//
//  Created by CODEXANB015 on 22/10/22.
//

//import SwiftUI
//
//class DetailPresenter: ObservableObject {
//  
//  private let detailUseCase: DetailUseCase
//  let showFavoriteButton: Bool
//  
//  @Published var meal: MealModel
//  @Published var errorMessage: String = ""
//  @Published var loadingState: Bool = false
//  @Published var isFavorited: Bool
//  
//  init(
//    detailUseCase: DetailUseCase,
//    showFavoriteButton: Bool
//  ) {
//    self.detailUseCase = detailUseCase
//    self.showFavoriteButton = showFavoriteButton
//    meal = detailUseCase.getMeal()
//    isFavorited = detailUseCase.checkIfFavorited(meal: detailUseCase.getMeal())
//  }
//  
//  func addFavorites() {
//    detailUseCase.addFavorites(meal: meal)
//  }
//  
//  func checkIfFavorited() -> Bool {
//    return detailUseCase.checkIfFavorited(meal: meal)
//  }
//  
//  func deleteFavorites() -> Void {
//    detailUseCase.deleteFavorites(meal: meal)
//  }
//  
//  func favoriteButtonPressed() {
//    if isFavorited {
//      deleteFavorites()
//      isFavorited = false
//    } else {
//      addFavorites()
//      isFavorited = true
//    }
//  }
//}
