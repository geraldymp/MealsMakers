//
//  HomeView.swift
//  MealsMakers
//
//  Created by CODEXANB015 on 22/10/22.
//

import SwiftUI

struct HomeView: View {
  
  @ObservedObject var presenter: HomePresenter
  
  var body: some View {
    ZStack {
      if presenter.loadingState {
        VStack {
          Text("Loading...")
          ProgressView()
        }
      } else {
        ScrollView(.vertical, showsIndicators: false) {
          HStack {
            self.presenter.linkBuilderFavorite {
              Text("Favorites")
            }
            Spacer()
            self.presenter.linkBuilderAbout {
              Text("About")
            }
          }
          .padding(.horizontal, 16)
          ForEach(
            self.presenter.meals,
            id: \.id
          ) { meal in
            ZStack {
              self.presenter.linkBuilderDetail(for: meal) {
                MealItem(meal: meal)
              }.buttonStyle(PlainButtonStyle())
            }.padding(8)
          }
        }
      }
    }.onAppear {
      if self.presenter.meals.count == 0 {
        self.presenter.getMeals()
      }
    }
  }
  
}
