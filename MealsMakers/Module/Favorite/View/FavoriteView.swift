//
//  FavoriteView.swift
//  MealsMakers
//
//  Created by CODEXANB015 on 22/10/22.
//

import SwiftUI
import CoreOfMealsMaker
import Meal

struct FavoriteView: View {
  @ObservedObject var presenter: GetFavoritePresenter<String, MealDomainModel, Interactor<String, [MealDomainModel], GetFavoritesRepository<GetFavoritesLocaleDataSource, FavoriteTransformer>>>
  
  var body: some View {
    ZStack {
      if presenter.isLoading {
        VStack {
          Text("Loading...")
          ProgressView()
        }
      } else {
        ScrollView(.vertical, showsIndicators: false) {
          if presenter.list.count == 0 {
            Text("List Kosong")
          } else {
            ForEach(
              presenter.list,
              id: \.id
            ) { meal in
              ZStack {
                linkBuilderDetail(for: meal) {
                  MealItem(meal: meal)
                }
              }.padding(8)
            }
            
          }
          
        }
      }
    }
    .onAppear{
      presenter.getFavorites(request: nil)
    }
  }
}

extension FavoriteView {
  func linkBuilderDetail<Content: View>(
    for meal: MealDomainModel,
    @ViewBuilder content: () -> Content
  ) -> some View {
    
    NavigationLink(
      destination: FavoriteRouter().makeDetailView(for: meal)
    ) { content() }
  }
}

