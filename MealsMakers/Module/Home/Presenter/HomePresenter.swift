//
//  HomePresenter.swift
//  MealsMakers
//
//  Created by CODEXANB015 on 22/10/22.
//

import SwiftUI
import Combine

class HomePresenter: ObservableObject {
  
  private var cancellables: Set<AnyCancellable> = []
  private let router = HomeRouter()
  private let homeUseCase: HomeUseCase
  
  @Published var meals: [MealModel] = []
  @Published var errorMessage: String = ""
  @Published var loadingState: Bool = false
  
  init(homeUseCase: HomeUseCase) {
    self.homeUseCase = homeUseCase
  }
  
  func getMeals() {
    loadingState = true
    homeUseCase.getMeals()
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
          case .failure:
            self.errorMessage = String(describing: completion)
          case .finished:
            self.loadingState = false
        }
      }, receiveValue: { meals in
        self.meals = meals
      })
      .store(in: &cancellables)
  }
  
  func linkBuilderFavorite<Content: View>(
    @ViewBuilder content: () -> Content
  ) -> some View {
    NavigationLink(
      destination: router.makeFavoriteView) {
        content()
      }
  }
  
  func linkBuilderAbout<Content: View>(
    @ViewBuilder content: () -> Content
  ) -> some View {
    NavigationLink(
      destination: router.makeAboutView) {
        content()
      }
  }
}
