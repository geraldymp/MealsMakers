//
//  FavoriteView.swift
//  MealsMakers
//
//  Created by CODEXANB015 on 22/10/22.
//

import SwiftUI

struct FavoriteView: View {
  @ObservedObject var presenter: FavoritePresenter
  
  var body: some View {
    ZStack {
      if presenter.loadingState {
        VStack {
          Text("Loading...")
          ProgressView()
        }
      } else {
        ScrollView(.vertical, showsIndicators: false) {
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
    }
    .onAppear{
      self.presenter.getFavorites()
    }
  }
}
