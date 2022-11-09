//
//  HomeView.swift
//  MealsMakers
//
//  Created by CODEXANB015 on 22/10/22.
//

import SwiftUI
import CoreOfMealsMaker
import Meal

struct HomeView: View {
  @ObservedObject var presenter: GetListPresenter<Any, MealDomainModel, Interactor<Any, [MealDomainModel], GetMealsRepository<GetMealsLocaleDataSource, GetMealsRemoteDataSource, MealTransformer>>>
  
  var body: some View {
    ZStack {
      if presenter.isLoading {
        ProgressView()
      } else if presenter.isError {
        Text("error")
      } else if presenter.list.isEmpty {
        Text("the list is empty")
      } else {
        ScrollView(showsIndicators: false) {
          HStack {
            linkBuilderFavorite {
              Text("Favorites")
            }
            Spacer()
            linkBuilderAbout {
              Text("About")
            }
          }
          .padding(.horizontal, 16)
          ForEach(
            self.presenter.list,
            id: \.id
          ) { meal in
            ZStack {
              linkBuilderDetail(for: meal) {
                MealItem(meal: meal)
              }
            }
          }
        }
      }
    }
    .onAppear {
      if presenter.list.count == 0 {
        presenter.getList(request: nil)
      }
    }
  }
}

extension HomeView {
  func linkBuilderDetail<Content: View>(
    for meal: MealDomainModel,
    @ViewBuilder content: () -> Content
  ) -> some View {
    
    NavigationLink(
      destination: HomeRouter().makeDetailView(for: meal)
    ) { content() }
  }
  
  func linkBuilderFavorite<Content: View>(
    @ViewBuilder content: () -> Content
  ) -> some View {
    
    NavigationLink(
      destination: HomeRouter().makeFavoriteView()
    ) { content() }
  }

  func linkBuilderAbout<Content: View>(
    @ViewBuilder content: () -> Content
  ) -> some View {
    
    NavigationLink(
      destination: HomeRouter().makeAboutView()
    ) { content() }
  }
}
